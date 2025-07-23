const mongoose = require('mongoose');
const { type } = require('os');

const rideSchema = new mongoose.Schema({
    user: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'user',
        required: true
    },
    captain: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'captain',
    },
    pickup: {
        type: String,
        required: true,
        minlength: 3,
    },
    destination: {
        type: String,
        required: true,
        minlength: 3,
    },
    fare: {
        type: Number,
        required: true,
        min: 0,
    },
    status: {
        type: String,
        enum: ['pending', 'accepted', 'ongoing', 'completed', 'cancelled'],
        default: 'pending',
    },
    duration: {
        type: String,
     
    },//in seconds
    distance: {
        type: String,
      
    },// in meters
    paymentID: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Payment',
    },
    orderId: {
        type: String,
    },
    signature: {
        type: String,
    },
    otp: {
        type: String,
        select: false,
        required: true,
    },
    createdAt: {
        type: Date,
        default: Date.now,
    },
});

const Ride = mongoose.model('ride', rideSchema);
module.exports = Ride;