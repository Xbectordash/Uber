const mongoose = require("mongoose");
const { type } = require("os");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

const captainSchema = new mongoose.Schema({
  fullname: {
    firstname: {
      type: String,
      required: true,
      minLength: [3, "First name must be at least 3 characters long"],
    },
    lastname: {
      type: String,
      required: true,
      minLength: [3, "Last name must be at least 3 characters long"],
    },
  },
  email: {
    type: String,
    required: true,
    unique: true,
    match: [/^\S+@\S+\.\S+$/, "Please enter a valid email address"],
    minLength: [5, "Email must be at least 5 characters long"],
  },
  password: {
    type: String,
    required: true,
    select: false, // This field will not be selected in queries
  },
  socketid: {
    type: String,
  },
  status: {
    type: String,
    enum: ["active", "inactive", "banned"],
    default: "active",
  },
  vehicle: {
    color: {
      type: String,
      required: true,
      minLength: [3, "Color must be at least 3 characters long"],
    },
    plate: {
      type: String,
      required: true,
      unique: true,
      minLength: [1, "Vehicle plate number must be at least 1 character long"],
      match: [/^[A-Z0-9]{1,10}$/, "Please enter a valid vehicle plate number"],
    },
    capacity: {
      type: Number,
      required: true,
      min: [1, "Vehicle capacity must be at least 1"],
    },
    vehicleType: {
      type: String,
      required: true,
      enum: ["car", "motorcycle", "auto"],
    },
  },
  location: {
    ltd: {
      type: Number,
      min: -90,
      max: 90,
    },
    lng: {
      type: Number,

      min: -180,
      max: 180,
    },
  },
  createdAt: {
    type: Date,
    default: Date.now,
  },
  socketId: {
    type: String,
  },
});

captainSchema.methods.generateAuthToken = function () {
  const token = jwt.sign({ id: this._id }, process.env.JWT_SECRET, {
    expiresIn: "24h",
  });
  return token;
};
captainSchema.methods.comparePassword = async function (password) {
  return await bcrypt.compare(password, this.password);
};
captainSchema.statics.hashPassword = async function (password) {
  if (!password) {
    throw new Error("Password is required for hashing");
  }
  const salt = await bcrypt.genSalt(10);
  const hashedPassword = await bcrypt.hash(password, salt);
  return hashedPassword;
};

const captainModel = mongoose.model("captain", captainSchema);
module.exports = captainModel;
