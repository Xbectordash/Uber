const userModel = require("../model/user.model");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const { BlockList } = require("net");

module.exports.authUser = async (req, res, next) => { 

    const token = req.cookies.token || req.headers.authorization?.split(" ")[1];
    if (!token) {
        return res.status(401).json({ message: "Unauthorized access" });
    }
    const blacklistModel = require("../model/blacklist.model");
    const isBlacklisted = await blacklistModel.exists({ token: token });
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