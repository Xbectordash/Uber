const mapsService = require("../services/maps.services");
const { validationResult } = require("express-validator");
module.exports.getCoordinates = async (req, res) => {
    const errors = validationResult(req);
  if (!errors.isEmpty()) {
    return res.status(400).json({ errors: errors.array() });
  }
  const { address } = req.query;
  if (!address) {
    return res.status(400).json({ message: "Address is required" });
  }
  
  try {
    const coordinates = await mapsService.getAddress(address);
    res.status(200).json({
      message: "Coordinates fetched successfully",
      coordinates: coordinates,
    });
  } catch (error) {
    return res.status(500).json({
      message: "Internal Server Error",
      error: error.message,
    });
  }
};
module.exports.getDistanceTime = async (req, res) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    return res.status(400).json({ errors: errors.array() });
  }
  const { origin, destination } = req.query;
  if (!origin || !destination) {
    return res.status(400).json({ message: "Origin and destination are required" });
  }
  
  try {
    const distanceTime = await mapsService.getDistanceAndTime(origin, destination);
    res.status(200).json({
      message: "Distance and time fetched successfully",
      distanceTime: distanceTime,
    });
  } catch (error) {
    return res.status(500).json({
      message: "Internal Server Error",
      error: error.message,
    });
  }
}
module.exports.getSuggestions = async (req, res) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    return res.status(400).json({ errors: errors.array() });
  }
  const { input } = req.query;
  if (!input) {
    return res.status(400).json({ message: "Input is required" });
  }
  
  try {
    const suggestions = await mapsService.getSuggestions(input);
    res.status(200).json({
      message: "Suggestions fetched successfully",
      suggestions: suggestions,
    });
  } catch (error) {
    return res.status(500).json({
      message: "Internal Server Error",
      error: error.message,
    });
  }
}