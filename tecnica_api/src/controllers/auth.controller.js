const db = require("../config/db");
const bcrypt = require("bcrypt");

// Login del usario profesor
exports.login = async (req, res) => {
  const { dni, contrasena } = req.body;

  if (!dni || !contrasena) {
    return res.status(400).json({ error: "DNI y contraseña son requeridos" });
  }

  const query = "SELECT * FROM credencial_profesor WHERE dni = ?";

  db.query(query, [dni], async (err, results) => {
    if (err) return res.status(500).json({ error: "Error interno"});

    if (results.length === 0) {
      return res.status(401).json({ error: "DNI o contraseña incorrectos" });
    }

    const usuario = results[0];
    const match = await bcrypt.compare(contrasena, usuario.contrasena);

    if (!match) {
      return res.status(401).json({ error: "DNI o contraseña incorrectos" });
    }

    res.json({ mensaje: "Login exitoso" });
  });
};

// Registro del usario profesor

exports.register = async (req, res) => {
  const { dni, materia, curso, seccion, grupo, contrasena } = req.body;

  if (!dni || !materia || !curso || !seccion || !grupo || !contrasena) {
    return res.status(400).json({ mensaje: "Faltan campos obligatorios" });
  }

  const hash = await bcrypt.hash(contrasena, 10);

  const query = `CALL registro_materia_profesor(?, ?, ?, ?, ?, ?)`;

  db.query(query, [dni, materia, curso, seccion, grupo, hash], err => {
   

    if (err) return res.status(500).json({ mensaje: "Error DB" });

    res.status(201).json({ mensaje: "Registro exitoso" });
  });
};
