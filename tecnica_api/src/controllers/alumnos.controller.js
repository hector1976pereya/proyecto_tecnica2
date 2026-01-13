const db = require("../config/db");

exports.getAlumnos = (req, res) => {
  const { materia, anio, seccion, grupo } = req.query;

  const query = "CALL f_p_get_alumnos(?,?,?,?)";

  db.query(query, [materia, anio, seccion, grupo], (err, results) => {
    if (err) return res.status(500).json(err);
    res.json(results[0]);
  });
};


exports.guardarNotas = async (req, res) => {
  const { periodo, materia, notas } = req.body;

  try {
    const promesas = notas.map(n => {
      return new Promise((resolve, reject) => {
        const sql = "CALL f_p_GuardarNota(?, ?, ?, ?)";
        db.query(sql, [materia, periodo, n.id, n.calificacion], err => {
          if (err) reject(err);
          else resolve();
        });
      });
    });

    await Promise.all(promesas);
    res.json({ message: "Todas las notas fueron procesadas con éxito" });

  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error interno al guardar notas" });
  }
};
