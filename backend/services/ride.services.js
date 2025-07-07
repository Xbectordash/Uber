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
  user,
  pickup,
  destination,
  vehicleType,
}) => {
  if (!user || !pickup || !destination || !vehicleType) {
    throw new Error("All fields are required to create a ride");
  }

  const fare = await getFare(pickup, destination);
  console.log("Fare calculated:", fare);
  console.log("before calling create ridemodel")
  const ride = rideModel.create({
    user,
    pickup,
    destination,
    otp: getOtp(6),
    fare: fare[vehicleType],
    vehicleType,
  });

  return await ride;
};
module.exports.confirmRide = async (rideId, captain) => {
  if (!rideId) {
    throw new Error('Ride id is required');
  }

  if (!captain || !captain._id) {
    throw new Error('Captain is required');
  }

  await rideModel.findOneAndUpdate(
    { _id: rideId },
    {
      status: 'accepted',
      captain: captain._id
    }
  );

  console.log("start calling findOne and populate user");
  const ride = await rideModel.findOne({ _id: rideId }).populate('user').populate('captain').select('+otp');


  if (!ride) {
    throw new Error('Ride not found');
  }

  return ride;
};
module.exports.startRide = async ({ rideId, otp, captain }) => {
  if (!rideId || !otp) {
    throw new Error('Ride ID and OTP are required');
  }

  const ride = await rideModel.findOne({ _id: rideId })
    .populate('user')
    .populate('captain')
    .select('+otp');

  if (!ride) {
    throw new Error('Ride not found');
  }

  if (ride.status !== 'accepted') {
    throw new Error('Ride not accepted');
  }

  if (ride.otp !== otp) {
    throw new Error('Invalid OTP');
  }

  await rideModel.findOneAndUpdate(
    { _id: rideId },
    { status: 'ongoing' }
  );

  // sendMessageToSocketId(ride.user.socketId, {
  //   event: 'ride-started',
  //   data: ride,
  // });

  return ride;
};
module.exports.endRide = async ({ rideId, captain }) => {
  if (!rideId) {
    throw new Error('Ride ID is required');
  }

  const ride = await rideModel.findOne({
    _id: rideId,
    captain: captain._id,
  })
    .populate('user')
    .populate('captain')
    .select('+otp');

  if (!ride) {
    throw new Error('Ride not found');
  }

  if (ride.status !== 'ongoing') {
    throw new Error('Ride is not ongoing');
  }

  await rideModel.findOneAndUpdate(
    { _id: rideId },
    { status: 'completed' }
  );

  return ride;
};
