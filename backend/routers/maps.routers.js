const express = require('express');
const router = express.Router();
const mapCordinates = require('../controller/map.contoller');
const authMiddleware = require("../middleware/auth.middleware");
const {query} = require('express-validator');

router.get('/get-coordinates',
    query('address').isString().isLength({min:3}).withMessage('Address must be at least 3 characters long'),
    authMiddleware.authUser, mapCordinates.getCoordinates);

router.get('/get-distance-time',
    query('origin').isString().isLength({min:3}).withMessage('Origin must be at least 3 characters long'),
    query('destination').isString().isLength({min:3}).withMessage('Destination must be at least 3 characters long'),
    authMiddleware.authUser, mapCordinates.getDistanceTime
)    

router.get('/get-suggestions',
    query('input').isString().isLength({min:3}).withMessage('Input must be at least 3 characters long'),
    authMiddleware.authUser, mapCordinates.getSuggestions
);
module.exports = router;