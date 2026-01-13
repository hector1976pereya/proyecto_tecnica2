const express = require("express");
const cors = require("cors");
require('dotenv').config();

const authRoutes = require("./src/routes/auth.routes");
const alumnosRoutes = require("./src/routes/alumnos.routes");


const app = express();

app.use(cors());
app.use(express.json());

app.use("/auth-profesor", authRoutes);
app.use("/profesor", alumnosRoutes);


module.exports = app;
