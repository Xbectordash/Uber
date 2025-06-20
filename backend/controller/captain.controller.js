const captainModel = require("../model/captain.model");
const { validationResult } = require("express-validator");
const captainService = require("../services/captain.services");
const blacklistModel = require("../model/blacklist.model");

module.exports.registerCaptain = async (req, res) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    return res.status(400).json({ errors: errors.array() });
  }
  const { fullname, email, password, vehicle } = req.body;
  const isCaptainExists = await captainModel.exists({ email: email });
  if (isCaptainExists) {
    return res.status(400).json({ message: "Captain already exists" });
  }
  const hashPassword = await captainModel.hashPassword(password);
  if (!fullname || !email || !hashPassword || !vehicle) {
    return res.status(400).json({ message: "All fields are required" });
  }

  try {
    const captain = await captainService.createCaptain({
      firstname: fullname.firstname,
      lastname: fullname.lastname,
      email: email,
      password: hashPassword,
      color: vehicle.color,
      plate: vehicle.plate,
      capacity: vehicle.capacity,
      vehicleType: vehicle.vehicleType,
    });
    if (!captain) {
      return res.status(400).json({ message: "Captain registration failed" });
    }
    const token = captain.generateAuthToken();
    res.status(201).json({
      message: "Captain registered successfully",
      captain: {
        id: captain._id,
        fullname: captain.fullname,
        email: captain.email,
        vehicle: captain.vehicle,
      },
      token: token,
    });
  } catch (error) {
    return res
      .status(500)
      .json({ message: "Internal Server Error", error: error.message });
  }
};

module.exports.loginCaptain = async (req, res) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    return res.status(400).json({ errors: errors.array() });
  }
  const { email, password } = req.body;
  try {
    const captain = await captainModel
      .findOne({ email: email })
      .select("+password");
    if (!captain) {
      return res.status(401).json({ message: "Invalid email or password" });
    }
    const isMatch = await captain.comparePassword(password);
    if (!isMatch) {
      return res.status(401).json({ message: "Invalid email or password" });
    }
    const token = captain.generateAuthToken();
    res.cookie("token", token);
    res.status(200).json({
      message: "Captain logged in successfully",
      captain: {
        id: captain._id,
        fullname: captain.fullname,
        email: captain.email,
        vehicle: captain.vehicle,
      },
      token: token,
    });
  } catch (error) {
    return res
      .status(500)
      .json({ message: "Internal Server Error", error: error.message });
  }
};
module.exports.getCaptainProfile = async (req, res) => {
return res.status(200).json({
    captain: req.captain,
  });
};

module.exports.logoutCaptain = async (req, res) => {
  try {
    const token = req.cookies.token;
    if (!token) {
      return res.status(401).json({ message: "No token provided" });
    }
    await blacklistModel.create({ token: token });
    res.clearCookie("token");
    res.status(200).json({ message: "Captain logged out successfully" });
  } catch (error) {
    return res
      .status(500)
      .json({ message: "Internal Server Error", error: error.message });
  }
};