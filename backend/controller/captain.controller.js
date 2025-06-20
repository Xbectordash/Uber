const captainModel = require("../model/captain.model");
const { validationResult } = require("express-validator");
const captainService = require("../services/captain.services");

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
            vehicleType: vehicle.vehicleType

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
                vehicle: captain.vehicle
            },
            token: token
        });
    } catch (error) {
        return res.status(500).json({ message: "Internal Server Error", error: error.message });
    }
}

