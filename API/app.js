const express = require('express'); 
const morgan = require('morgan');
const bodyParser = require('body-parser');
const app = express();
const userRoutes = require('./api/routes/users');
const authRoutes = require('./api/routes/authentication');

app.use(morgan("dev"));
app.use(bodyParser.urlencoded({
    extended: false
}))
app.use(bodyParser.json());

app.use("/users", userRoutes);
app.use("/authentication", authRoutes);

app.use((req, res, next) => {
    const error = new Error("Not found");
    error.status = 404;
    next(error);
  });
  
  app.use((error, req, res, next) => {
    res.status(error.status || 500);
    res.json({
      error: {
        message: error.message
      }
    });
  });

module.exports = app;