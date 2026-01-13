const express = require("express");
const router = express.Router();
const alumnosController = require("../controllers/alumnos.controller");


router.get("/alumnos", alumnosController.getAlumnos);
router.post("/notas", alumnosController.guardarNotas)
 
module.exports = router;
