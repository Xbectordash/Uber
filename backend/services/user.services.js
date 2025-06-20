const userModel = require("../model/user.model");

const createUser = async (userData) => {
    const { firstname, lastname, email, password } = userData;
    if (!firstname || !email || !password) {
        throw new Error("All fields are required");
    }
    const existingUser = await userModel.findOne({ email: email });
    if (existingUser) {
        throw new Error("User already exists");
    }
    const user = userModel.create({
        fullname: {
            firstname: firstname,
            lastname: lastname
        },
        email: email,
        password: password
    });
    return user;

};

module.exports = { createUser };