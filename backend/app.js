const dotenv = require('dotenv');
dotenv.config();
const express = require('express');
const app = express();
const cors = require('cors');
const connectToDB = require('./db/connectDB');
const userRouter = require('./routers/routers');

connectToDB();


app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.get('/', (req, res) => {
  res.send('Welcome to the Uber Eats Clone API');
});

app.use('/api/users', userRouter);

module.exports = app;