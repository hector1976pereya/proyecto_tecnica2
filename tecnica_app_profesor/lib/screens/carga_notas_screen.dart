import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/notas_alumnos.dart';
import '../models/alumno.dart';
import '../widgets/app_bar.dart';


class RegistroNotas extends StatefulWidget {
  const RegistroNotas({super.key});

  @override
  State<RegistroNotas> createState() => _RegistroNotasState();
}



class _RegistroNotasState extends State<RegistroNotas> {

 // Creación de variables
  String? materia, anio, seccion, grupo, periodo;
  List<Alumno> alumnosMostrados = [];
  bool cargando = false;


  final String baseUrl = "http://192.168.1.200/api";

 
  Future<void> fetchAlumnos() async {

    if (materia != null && anio != null && seccion != null && grupo != null) {
      setState(() => cargando = true);
      try {
        final resp = await http.get(Uri.parse(
            "$baseUrl/profesor/alumnos?materia=$materia&anio=$anio&seccion=$seccion&grupo=$grupo"));
        
        if (resp.statusCode == 200) {
          List<dynamic> data = json.decode(resp.body);
          setState(() {
            alumnosMostrados = data.map((json) => Alumno.fromJson(json)).toList();
          });
        }
      } catch (e) {
        print("Error: $e");
      } finally {
        setState(() => cargando = false);
      }
    }
  }

 // Método que se encarga de enviar notas de cada uno de los alumnos
 
 Future<void> guardarEnBackend() async {
  if (periodo == null) {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Por favor seleccione un período")));
    return;
  }

  try {
    final body = json.encode({
      "periodo": periodo,
      "materia": materia,
      "notas": alumnosMostrados.map((a) => {
        "id": a.idAlumno, // Enviamos el ID real
        "calificacion": a.nota ?? 0.0
      }).toList()
    });

    final response = await http.post(
      Uri.parse("$baseUrl/profesor/notas"),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("¡Calificaciones guardadas con éxito!")));
    }
  } catch (e) {
    print("Error al guardar: $e");
  }
}

  //==========================================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(nombre: "Héctor"),
      body: Column(
        children: [
          _buildFiltros(),
         
          if (cargando) const LinearProgressIndicator(),
           const SizedBox(height: 15), // <--- Añade este widget
          _buildListaAlumnos(),
        ],
      ),


      floatingActionButton: alumnosMostrados.isNotEmpty && periodo != null
          ? FloatingActionButton.extended(
              onPressed: guardarEnBackend,
              label: const Text("Guardar en DB"),
              icon: const Icon(Icons.cloud_upload),
            )
          : null,
    );
  }
  //=====================================================
  //Sección donde se construye el filtro
  //=====================================================

  Widget _buildFiltros() {
    
  return Container(
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.05),
          blurRadius: 15,
          offset: const Offset(0, 5),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "CARGA DE NOTAS",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        const SizedBox(height: 20),
        
        // FILA 1: Materia y Año
        Row(
          children: [
            //Se carga la varable materia
            Expanded(
              child: _customDropdown(
                label: "Materia",
                icon: Icons.book_outlined,
                value: materia,
                items: SchoolData.estructuraEscolar.keys.toList(),
                onChanged: (val) => setState(() {
                  materia = val;
                  anio = seccion = grupo = null;
                  alumnosMostrados = [];
                }),
              ),
            ),
            const SizedBox(width: 15),
            //Se carga la varable año
            Expanded(
              child: _customDropdown(
                label: "Año",
                icon: Icons.calendar_today_outlined,
                value: anio,
                items: (materia == null || SchoolData.estructuraEscolar[materia] == null)
                    ? []
                    : (SchoolData.estructuraEscolar[materia] as Map).keys.toList(),
                onChanged: (val) => setState(() {
                  anio = val;
                  seccion = grupo = null;
                  alumnosMostrados = [];
                }),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),

        // FILA 2: Sección y Grupo
        Row(
          children: [
            //Se carga la varable sección
            Expanded(
              child: _customDropdown(
                label: "Sección",
                icon: Icons.grid_view_outlined,
                value: seccion,
                items: (anio == null || SchoolData.estructuraEscolar[materia][anio] == null)
                    ? []
                    : (SchoolData.estructuraEscolar[materia][anio] as List),
                onChanged: (val) => setState(() {
                  seccion = val;
                  grupo = null;
                  alumnosMostrados = [];
                }),
              ),
            ),
            const SizedBox(width: 15),
            // Se carga la variable grupo
            Expanded(
              child: _customDropdown(
                label: "Grupo",
                icon: Icons.group_outlined,
                value: grupo,
                items: ["A", "B", "AB"],
                itemLabelBuilder: (val) => "Grupo $val",
                onChanged: (val) {
                  setState(() => grupo = val);
                  fetchAlumnos();
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),

        // FILA 3: Período (Ocupa todo el ancho)
        
        _customDropdown(
          label: "Período Académico",
          icon: Icons.timer_outlined,
          value: periodo,
          items: ["1I", "1C", "2I", "2C"],
          itemLabelBuilder: (val) {
            if (val == "1I") return "1° Informe";
            if (val == "1C") return "1° Cuatrimestre";
            if (val == "2I") return "2° Informe";
            if (val == "2C") return "2° Cuatrimestre";
            return val;
          },
          onChanged: (val) => setState(() => periodo = val),
        ),
      ],
    ),
  );
}

// Helper para no repetir código y mantener la vista limpia
Widget _customDropdown({
  required String label,
  required IconData icon,
  required dynamic value,
  required List items,
  required Function(dynamic) onChanged,
  String Function(dynamic)? itemLabelBuilder,
}) {
  return DropdownButtonFormField<String>(
    initialValue: value,
    isExpanded: true,
    decoration: InputDecoration(
      prefixIcon: Icon(icon, size: 20, color: Colors.blueGrey),
      labelText: label,
      labelStyle: const TextStyle(color: Colors.blueGrey, fontSize: 14),
      filled: true,
      fillColor: Colors.grey.shade50,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade200),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
      ),
    ),
    items: items.map((item) {
      return DropdownMenuItem<String>(
        value: item.toString(),
        child: Text(
          itemLabelBuilder != null ? itemLabelBuilder(item) : item.toString(),
          style: const TextStyle(fontSize: 15),
        ),
      );
    }).toList(),
    onChanged: onChanged,
  );
}

//=================================================================================================

 Widget _buildListaAlumnos() {
  return Expanded(
    child: alumnosMostrados.isEmpty
        ? const Center(child: Text("Sin alumnos. Filtre por Grupo."))
        : ListView.builder(
            itemCount: alumnosMostrados.length,
            // Agregamos un padding para que el botón flotante no tape el último alumno
            padding: const EdgeInsets.only(bottom: 80), 
            itemBuilder: (context, index) {
              final alumno = alumnosMostrados[index];
              
              return Card( // Usamos Card para que se vea más limpio
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  leading: CircleAvatar(child: Text(alumno.nombre[0])),
                  title: Text("${alumno.apellido}, ${alumno.nombre}"),
                  subtitle: Text("DNI: ${alumno.dni}"),
                  trailing: SizedBox(
                    width: 70,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: '0.0',
                        labelText: 'Nota',
                      ),
                      // Importante: Cargamos el valor si ya existe
                      controller: TextEditingController(
                        text: alumno.nota != null ? alumno.nota.toString() : ''
                      )..selection = TextSelection.collapsed(
                          offset: alumno.nota?.toString().length ?? 0
                        ),
                      onChanged: (v) {
                        // Guardamos el cambio en nuestra lista de objetos
                        alumno.nota = double.tryParse(v);
                      },
                    ),
                  ),
                ),
              );
            },
          ),
  );
}
}