const axios = require("axios");
require("dotenv").config();
const captainModel = require("../model/captain.model");

module.exports.getAddress = async (address) => {
  const apiKey = process.env.GOOGLE_MAPS_API_KEY; ;
  if (!apiKey)
    throw new Error("Google Maps API key not found in environment variables");

  const url = "https://maps.googleapis.com/maps/api/geocode/json";
  try {
    const { data } = await axios.get(url, {
      params: {
        address,
        key: apiKey,
      },
    });

    if (data.status === "OK" && data.results.length > 0) {
        const { lat, lng } = data.results[0].geometry.location;
        console.log(lat, lng);
      return { ltd: lat, lng: lng };
    } else {
      throw new Error("Unable to geocode address");
    }
  } catch (error) {
    throw new Error("Error fetching geocode data: " + error.message);
  }
};

module.exports.getDistanceAndTime = async (origin, destination) => {
    if (!origin || !destination) {
        throw new Error("Origin and destination are required");
    }
    const apiKey = process.env.GOOGLE_MAPS_API_KEY;
    if (!apiKey)
        throw new Error("Google Maps API key not found in environment variables");
    const url = "https://maps.googleapis.com/maps/api/distancematrix/json";
    try {
        const { data } = await axios.get(url, {
            params: {
                origins: origin,
                destinations: destination,
                key: apiKey,
            },
        });

        if (data.status === "OK" && data.rows.length > 0) {
            const element = data.rows[0].elements[0];
            if (element.status === "OK") {
                return {
                    distance: {
                        text: element.distance.text,
                        value: element.distance.value,
                    },
                    duration: {
                        text: element.duration.text,
                        value: element.duration.value,
                    },
                };
            } else {
                throw new Error("Unable to calculate distance and time");
            }
        } else {
            throw new Error("Invalid response from Distance Matrix API");
        }
    } catch (error) {
        throw new Error("Error fetching distance and time data: " + error.message);
    }
}
module.exports.getSuggestions = async (input) => {
    if (!input) {
        throw new Error("Input is required for suggestions");
    }
    const apiKey = process.env.GOOGLE_MAPS_API_KEY;
    if (!apiKey)
        throw new Error("Google Maps API key not found in environment variables");
    const url = "https://maps.googleapis.com/maps/api/place/autocomplete/json";
    try {
        const { data } = await axios.get(url, {
            params: {
                input,
                key: apiKey,
            },
        });

        if (data.status === "OK" && data.predictions.length > 0) {
            return data.predictions.map(prediction => ({
                description: prediction.description,
                place_id: prediction.place_id,
            }));
        } else {
            throw new Error("No suggestions found");
        }
    } catch (error) {
        throw new Error("Error fetching suggestions: " + error.message);
    }
}
module.exports.getCaptainsInTheRadius = async (ltd, lng, radius) => {
    // radius in km
    const captains = await captainModel.find({
        location: {
            $geoWithin: {
                $centerSphere: [[ltd,lng], radius/6371]
            }
        }
    })
    return captains;
}