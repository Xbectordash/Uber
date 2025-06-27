const rideModel = require("../model/ride.model");
const mapsService = require("./maps.services");
const crypto = require("crypto");

async function getFare(pickup, destination) {
  if (!pickup || !destination) {
    throw new Error("Pickup and destination are required to calculate fare");
  }
  const distanceTime = await mapsService.getDistanceAndTime(
    pickup,
    destination
  );
  if (!distanceTime || !distanceTime.distance || !distanceTime.duration) {
    throw new Error("Unable to fetch distance and time for fare calculation");
  }
  const baseFare = {
    auto: 30,
    car: 50,
    moto: 20,
  };
  const perKmRate = {
    auto: 10,
    car: 15,
    moto: 8,
  };
  const perMinRate = {
    auto: 2,
    car: 3,
    moto: 1.5,
  };

  console.log("Distance:", distanceTime);

  const fares = {};
  // Convert distance from meters to kilometers and duration from seconds to minutes
  const distanceInKm = distanceTime.distance.value / 1000;
  const durationInMin = distanceTime.duration.value / 60;

  // Use correct vehicle type keys
  for (const type of ["auto", "car", "moto"]) {
    fares[type] = Math.round(
      baseFare[type] +
        perKmRate[type] * distanceInKm +
        perMinRate[type] * durationInMin
    );
  }
  return fares;
}
module.exports = getFare;

function getOtp(num) {
  if (!num || typeof num !== "number" || num < 1) {
    throw new Error("A valid number of digits is required");
  }
  // Generate a random numeric OTP of length 'num' using crypto
  let otp = "";
  while (otp.length < num) {
    const byte = crypto.randomBytes(1)[0];
    if (byte >= 250) continue; // Avoid bias
    const digit = byte % 10;
    otp += digit.toString();
  }
  return otp;
}
module.exports.createRide = async ({
  userId,
  pickup,
  destination,
  vehicleType,
}) => {
  if (!userId || !pickup || !destination || !vehicleType) {
    throw new Error("All fields are required to create a ride");
  }

  const fare = await getFare(pickup, destination);
  console.log("Fare calculated:", fare);
  const ride = rideModel.create({
    userId,
    pickup,
    destination,
    otp: getOtp(6),
    fare: fare[vehicleType],
    vehicleType,
  });

  return await ride;
};
// Fix confirmRide to accept both rideId and otp
module.exports.confirmRide = async (rideId) => {
  if (rideId) {
    throw new Error('Ride id is required');
  }
  await rideModel.findOneAndUpdate({
    _id:rideId
  }, {
    status: 'accepted',
    captainID: captainID._id
  })
  const ride = await rideModel.findOne({
    _id: ride
  }).populate('user');

  if (!ride) {
    throw new Error('Ride not found');
  }
  return ride;

};
