import 'package:flutter/material.dart';
import '../data/materias_data.dart';
import '../services/auth_service.dart';
import '../widgets/custom_snackbar.dart';
import '../widgets/input_text_field.dart';
import '../widgets/input_dropdown_field.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  
  final _formKey = GlobalKey<FormState>();
  final _dniController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _materiaSeleccionada;
  String? _cursoSeleccionado;
  String? _seccionSeleccionada;
  String? _grupoSeleccionado;

  String _filtroMateria = "";
  bool _cargando = false;
  bool _obscureText = true;

  final List<String> _cursos = ['1', '2', '3'];
  final List<String> _secciones = ['1ra', '2da', '3ra', '4ta'];
  final List<String> _grupos = ['A', 'B', 'AyB'];

  void _mostrarBuscadorMaterias() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            final filtradas = MateriasData.materias
                .where((m) => m
                    .toLowerCase()
                    .contains(_filtroMateria.toLowerCase()))
                .toList();

            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(
                    "Seleccionar Materia",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    decoration:
                        const InputDecoration(prefixIcon: Icon(Icons.search)),
                    onChanged: (v) =>
                        setModalState(() => _filtroMateria = v),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: filtradas.length,
                      itemBuilder: (_, i) => ListTile(
                        title: Text(filtradas[i]),
                        onTap: () {
                          setState(() {
                            _materiaSeleccionada = filtradas[i];
                            _filtroMateria = "";
                          });
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _registrar() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _cargando = true);

    final result = await AuthService.register(
      dni: _dniController.text,
      materia: _materiaSeleccionada!,
      curso: _cursoSeleccionado!,
      seccion: _seccionSeleccionada!,
      grupo: _grupoSeleccionado!,
      contrasena: _passwordController.text,
    );

    setState(() => _cargando = false);

    if (!mounted) return;

    if (result["ok"]) {
      mostrarSnackBar(context, "¡Registro exitoso!", color: Colors.green);
      Navigator.pop(context);
    } else {
      mostrarSnackBar(context, result["mensaje"]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Altas de materias")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              InputTextField(
                controller: _dniController,
                label: "DNI",
                icon: Icons.badge_outlined,
                isNumber: true,
              ),

              GestureDetector(
                onTap: _mostrarBuscadorMaterias,
                child: AbsorbPointer(
                  child: InputTextField(
                    controller:
                        TextEditingController(text: _materiaSeleccionada),
                    label: "Materia",
                    icon: Icons.book_outlined,
                    suffix: const Icon(Icons.search),
                  ),
                ),
              ),

              Row(
                children: [
                  Expanded(
                    child: InputDropdownField(
                      label: "Año",
                      value: _cursoSeleccionado,
                      items: _cursos,
                      icon: Icons.school_outlined,
                      onChanged: (v) =>
                          setState(() => _cursoSeleccionado = v),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: InputDropdownField(
                      label: "Sección",
                      value: _seccionSeleccionada,
                      items: _secciones,
                      icon: Icons.segment_outlined,
                      onChanged: (v) =>
                          setState(() => _seccionSeleccionada = v),
                    ),
                  ),
                ],
              ),

              InputDropdownField(
                label: "Grupo",
                value: _grupoSeleccionado,
                items: _grupos,
                icon: Icons.group_outlined,
                onChanged: (v) =>
                    setState(() => _grupoSeleccionado = v),
              ),

              InputTextField(
                controller: _passwordController,
                label: "Contraseña",
                icon: Icons.lock_outline,
                isPassword: true,
                obscureText: _obscureText,
                suffix: IconButton(
                  icon: Icon(_obscureText
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: () =>
                      setState(() => _obscureText = !_obscureText),
                ),
              ),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: _cargando
                    ? const Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                        onPressed: _registrar,
                        child: const Text("Registrar Cuenta"),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
