const express = require('express');
const router = express.Router();
const {registerUser,loginUser} = require('../controller/user.controller');
const {body} = require('express-validator')

router.post('/register', [
    body('email').isEmail().withMessage('Please enter a valid eamil address'),
    body('password').isLength({ min: 6 }).withMessage('Password must be at least 6 characters long'),
    body('firstname').isLength({ min: 3}).withMessage('First name must be at least 3 characters long'),
], registerUser);

router.post('/login', [
    body('email').isEmail().withMessage('Please enter a valid eamil address'),
    body('password').isLength({ min: 6 }).withMessage('Password must be at least 6 characters long'),
], loginUser);

module.exports = router;