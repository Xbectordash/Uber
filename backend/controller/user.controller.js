const userModel = require("../model/user.model");
const { validationResult } = require("express-validator");
const userService = require("../services/user.services");
const e = require("express");

module.exports.registerUser = async (req, res) => {
  // Validate request body
  const { fullname, email, password } = req.body;
  console.log("Request body:", req.body);
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    return res.status(400).json({ errors: errors.array() });
  }
  try {
    const { firstname, lastname, email, password } = req.body;
    const hashPassword = await userModel.hashPassword(password);

    const user = await userService.createUser({
      firstname,
      lastname,
      email,
      password: hashPassword,
    });
    if (!user) {
      return res.status(400).json({ message: "User registration failed" });
    }
    const token = user.generateAuthToken();
    res.status(201).json({
      message: "User registered successfully",
      user: {
        id: user._id,
        fullname: user.fullname,
        email: user.email,
      },
      token: token,
    });
  } catch (error) {
    return res
      .status(500)
      .json({ message: "Internal Server Error", error: error.message });
  }
};
module.exports.loginUser = async (req, res) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    return res.status(400).json({ errors: errors.array() });
  }
  const { email, password } = req.body;
  try {
    const user = await userModel.findOne({ email: email }).select("+password");
    if (!user) {
      return res.status(401).json({ message: "Invalid email or password" });
    }
    const ismatch = await user.comparePassword(password);
    if (!ismatch) {
      return res.status(401).json({ message: "Invalid email or password" });
    }
    const token = user.generateAuthToken();
    res.status(200).json({
      message: "User logged in successfully",
      user: {
        id: user._id,
        fullname: user.fullname,
        email: user.email,
      },
      token: token,
    });
  } catch (error) {
    return res
      .status(500)
      .json({ message: "Internal Server Error", error: error.message });
  }
};
