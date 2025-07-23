const express = require('express');
const router = express.Router();
const {registerUser,loginUser,getUserProfile,logoutUser} = require('../controller/user.controller');
const { body } = require('express-validator')
const authMiddleware = require('../middleware/auth.middleware');

router.post('/register', [
    body('email').isEmail().withMessage('Please enter a valid eamil address'),
    body('password').isLength({ min: 6 }).withMessage('Password must be at least 6 characters long'),
    body('firstname').isLength({ min: 3}).withMessage('First name must be at least 3 characters long'),
], registerUser);

router.post('/login', [
    body('email').isEmail().withMessage('Please enter a valid eamil address'),
    body('password').isLength({ min: 6 }).withMessage('Password must be at least 6 characters long'),
], loginUser);

router.get('/profile', authMiddleware.authUser, getUserProfile),
router.get('/logout', authMiddleware.authUser, logoutUser);
    


module.exports = router;