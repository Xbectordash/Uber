const captainModel = require("../model/captain.model");

module.exports.createCaptain = async ({ firstname, lastname, email, password, color, plate, capacity, vehicleType }) => { 

    if (!firstname || !email || !password || !color || !plate || !capacity || !vehicleType) {
        throw new Error("All fields are required");
    }
    
    const existingCaptain = await captainModel.findOne({ email: email });
    if (existingCaptain) {
        throw new Error("Captain already exists");
    }
    
    const captain = await captainModel.create({
        fullname: {
        firstname: firstname,
        lastname: lastname
        },
        email: email,
        password: password,
        vehicle: {
        color: color,
        plate: plate,
        capacity: capacity,
        vehicleType: vehicleType
        }
    });
    
    return captain;
}
