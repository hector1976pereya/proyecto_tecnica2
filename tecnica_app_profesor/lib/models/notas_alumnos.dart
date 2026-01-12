class SchoolData {
  // Esta estructura solo sirve para llenar los Dropdowns
  static final Map<String, dynamic> estructuraEscolar = {
    'Ciencias Naturales': {
      '1':['1ra', '2da'],
      
    },
    'Ciencias Sociales': {
      '2':['1ra','2da'],
    },
  };
}


/*

Map<String, dynamic> estructuraEscolar = {}; // Empieza vacío

Future<void> cargarConfiguracionDocente() async {
  final response = await http.get(Uri.parse("$baseUrl/configuracion-docente?idProfesor=123"));
  if (response.statusCode == 200) {
    setState(() {
      estructuraEscolar = json.decode(response.body);
    });
  }
}

*/