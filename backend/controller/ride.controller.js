const rideService = require("../services/ride.services");
const { validationResult } = require("express-validator");
const mapsService = require("../services/maps.services");
const { sendMessageToSocket } = require("../socket");
const rideModel = require("../model/ride.model");

module.exports.createRide = async (req, res) => {
  console.debug("createRide called with body:", req.body);

  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    console.debug("Validation errors:", errors.array());
    return res.status(400).json({ errors: errors.array() });
  }

  const { pickupLocation, dropoffLocation, vehicleType } = req.body;

  if (!pickupLocation || !dropoffLocation || !vehicleType) {
    console.debug("Missing required fields:", { pickupLocation, dropoffLocation, vehicleType });
    return res.status(400).json({ message: "All fields are required" });
  }

  try {
    const ride = await rideService.createRide({
      userId: req.user._id,
      pickup: pickupLocation,
      destination: dropoffLocation,
      vehicleType: vehicleType,
    });

    if (!ride) {
      console.debug("Ride creation failed for user:", req.user._id);
      return res.status(400).json({ message: "Ride creation failed" });
    }

    console.debug("Ride created:", ride);

    res.status(201).json({
      message: "Ride created successfully",
      ride: ride,
    });

    (async () => {
      try {
        const pickupCoordinates = await mapsService.getAddress(pickupLocation);
        console.debug("pickupCoordinates", pickupCoordinates);

        const captainsInRadius = await mapsService.getCaptainsInTheRadius(
          pickupCoordinates.ltd,
          pickupCoordinates.lng,
          5
        );

        console.debug("captainsInRadius found:", captainsInRadius.length);

        ride.otp = "";

        const rideWithUser = await rideModel
          .findOne({ _id: ride._id })
          .populate("userId");

        captainsInRadius.map((captain) => {
          console.debug("Sending ride-request to captain:", captain.socketId);
          sendMessageToSocket(captain.socketId, {
            event: "ride-request",
            data: rideWithUser,
          });
        });

        console.debug("captainsInRadius details:", captainsInRadius);
      } catch (err) {
        console.error("Background error in createRide:", err.message);
      }
    })();
  } catch (error) {
    if (!res.headersSent) {
      console.error("Error in createRide:", error.message);
      return res.status(500).json({ message: "Internal Server Error", error: error.message });
    } else {
      console.error("Error after response sent:", error.message);
    }
  }
};

module.exports.getFare = async (req, res) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    return res.status(400).json({ errors: errors.array() });
  }

  const { pickup, destination } = req.query;

  if (!pickup || !destination) {
    return res.status(400).json({ message: "All fields are required" });
  }

  try {
    const fare = await rideService(pickup, destination);
    res.status(200).json({ message: "Fare fetched successfully", fare: fare });
  } catch (error) {
    return res
      .status(500)
      .json({ message: "Internal Server Error", error: error.message });
  }
};

module.exports.confirmRide = async (req, res) => {
  console.debug("confirmRide called with body:", req.body);

  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    console.debug("Validation errors in confirmRide:", errors.array());
    return res.status(400).json({ errors: errors.array() });
  }

  const { id } = req.body;

  if (!id) {
    console.debug("Missing ride id in confirmRide");
    return res.status(400).json({ message: "All fields are required" });
  }

  try {
    const ride = await rideService.confirmRide(id);
    console.debug("Ride confirmed:", ride);

    sendMessageToSocket(ride.user.socketId, { event: "ride-confirmed", data: ride });

    res.status(200).json({ message: "Ride confirmed successfully", ride: ride });
  } catch (error) {
    console.error("Error in confirmRide:", error.message);
    return res
      .status(500)
      .json({ message: "Internal Server Error", error: error.message });
  }
};
