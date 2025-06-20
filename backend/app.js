const dotenv = require('dotenv');
dotenv.config();
const express = require('express');
const app = express();
const cors = require('cors');
const connectToDB = require('./db/connectDB');
const userRouter = require('./routers/routers');
const captainRouter = require('./routers/captain.router');
const cookies = require('cookie-parser');

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

module.exports = app;