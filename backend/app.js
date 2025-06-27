const dotenv = require('dotenv');
dotenv.config();
const express = require('express');
const app = express();
const cors = require('cors');
const connectToDB = require('./db/connectDB');
const userRouter = require('./routers/routers');
const captainRouter = require('./routers/captain.router');
const cookies = require('cookie-parser');
const mapsRoutes = require('./routers/maps.routers');
const rideRoutes = require('./routers/ride.routes');

connectToDB();


app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cookies());

app.get('/', (req, res) => {
  res.send('Welcome to the Uber Eats Clone API');
});

app.use('/api/users', userRouter);
app.use('/api/captains', captainRouter);
app.use('/api/maps', mapsRoutes);
app.use('/api/rides', rideRoutes);

module.exports = app;