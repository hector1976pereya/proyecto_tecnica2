class Alumno {
  final int idAlumno; 
  final int dni;
  final String nombre;
  final String apellido;
  double? nota;

  Alumno({
    required this.idAlumno,
    required this.dni, 
    required this.nombre, 
    required this.apellido, 
    this.nota
  });

  factory Alumno.fromJson(Map<String, dynamic> json) {
    return Alumno(
      idAlumno: json['id'],
      nombre: json['nombre'],
      apellido: json['apellido'],
      dni: json['dni'],
     
    );
  }
}