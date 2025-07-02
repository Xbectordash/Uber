const { map } = require("../app");
const getFare = require("../services/ride.services");
const { validationResult } = require("express-validator");
const mapsService = require("../services/maps.services");
const { sendMessageToSocket } = require("../socket");
const rideModel = require("../model/ride.model");

module.exports.createRide = async (req, res) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    return res.status(400).json({ errors: errors.array() });
  }

  const { pickupLocation, dropoffLocation, vehicleType } = req.body;

  if (!pickupLocation || !dropoffLocation || !vehicleType) {
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
      return res.status(400).json({ message: "Ride creation failed" });
    }

    res.status(201).json({
      message: "Ride created successfully",
      ride: ride,
    });
    const pickupCoordinates = await mapsService.getAddress(pickupLocation);
    console.log("pickupCoordinates", pickupCoordinates);
    const captainsInRadius = await mapsService.getCaptainsInTheRadius(
      pickupCoordinates.ltd,
      pickupCoordinates.lng,
      5
    );
      ride.otp = "";
      const rideWithUser = await rideModel.findOne(ride._id).populate("userId");
    captainsInRadius.map((captain) => {
      sendMessageToSocket(captain.socketId, {
        event: "ride-request",
        data: rideWithUser,
      });
    });

    console.log("captainsInRadius", captainsInRadius);
  } catch (error) {
    return res
      .status(500)
      .json({ message: "Internal Server Error", error: error.message });
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
    const fare = await getFare(pickup, destination);
    res.status(200).json({ message: "Fare fetched successfully", fare: fare });
  } catch (error) {
    return res
      .status(500)
      .json({ message: "Internal Server Error", error: error.message });
  }
};

module.exports.confirmRide = async (req, res) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    return res.status(400).json({ errors: errors.array() });
  }
  const {id} = req.body;
  if (!id) {
    return res.status(400).json({ message: "All fields are required" });
  }
  try {
    const ride = await rideService.confirmRide(id);
    sendMessageToSocket(ride.user.socketId,{event:'ride-confirmed',data:ride})
    res.status(200).json({ message: "Ride confirmed successfully", ride: ride });
  } catch (error) {
    return res
      .status(500)
      .json({ message: "Internal Server Error", error: error.message });
  }
};
