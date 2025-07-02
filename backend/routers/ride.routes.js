const express = require('express');
const router = express.Router();
const { body,query } = require('express-validator');
const rideController = require('../controller/ride.controller');
const authMiddleware = require("../middleware/auth.middleware");

router.post('/create-ride', [
    authMiddleware.authUser,
    body('pickupLocation').isString().isLength({ min: 3 }).withMessage('Pickup location must be at least 3 characters long'),
    body('dropoffLocation').isString().isLength({ min: 3 }).withMessage('Dropoff location must be at least 3 characters long'),
    body('vehicleType').isIn(['car', 'moto', 'auto']).withMessage('Vehicle type must be one of: car, motorcycle, auto'),
], rideController.createRide);

router.get('/get-fare',
    authMiddleware.authUser,
    query('pickup').isString().isLength({ min: 3 }).withMessage('Invalid pickup address'),
    query('destination').isString().isLength({min:3}).withMessage('Invalid destination address'),

    rideController.getFare
)
router.post('/confirm-ride',authMiddleware.authCaptain,body('rideId').isMongoId().withMessage('Invalid ride id'),rideController.confirmRide);


module.exports = router;