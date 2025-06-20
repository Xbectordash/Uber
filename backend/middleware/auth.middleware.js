const userModel = require("../model/user.model");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const blacklistModel = require("../model/blacklist.model");
const { BlockList } = require("net");
const captainModel = require("../model/captain.model");
const BlacklistModel = require("../model/blacklist.model");

module.exports.authUser = async (req, res, next) => { 

    const token = req.cookies.token || req.headers.authorization?.split(" ")[1];
    if (!token) {
        return res.status(401).json({ message: "Unauthorized access" });
    }

    const isBlacklisted = await BlacklistModel.exists({ token: token });
    if (isBlacklisted) {
        return res.status(401).json({ message: "Unauthorized access" });
    }
    try {
        const decoded = jwt.verify(token, process.env.JWT_SECRET);
        const user = await userModel.findById(decoded.id).select("-password");
        if (!user) {
            return res.status(401).json({ message: "Unauthorized access" });
        }
        req.user = user;
        next();
    } catch (error) {
        return res.status(401).json({ message: "Unauthorized access" });
    }
}
module.exports.authCaptain = async (req, res, next) => {
    const token = req.cookies.token || req.headers.authorization?.split(" ")[1];
    console.log("token", token);
    if (!token) {
        return res.status(401).json({ message: "Unauthorized access" });
    }

   
    const isBlacklisted = await BlacklistModel.exists({ token: token });
    console.log("isBlacklisted", isBlacklisted);
    if (isBlacklisted) {
        return res.status(401).json({ message: "Unauthorized access" });
    }
    try {
        const decoded = jwt.verify(token, process.env.JWT_SECRET);

        const captain = await captainModel.findById(decoded.id).select("-password");
        console.log("captain", captain);
        if (!captain) {
            return res.status(401).json({ message: "Unauthorized access" });
        }

        req.captain = captain;
        next();
    } catch (error) {
        return res.status(401).json({ message: "Unauthorized access" });
    }
}