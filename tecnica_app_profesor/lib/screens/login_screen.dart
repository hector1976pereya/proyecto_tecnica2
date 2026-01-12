import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../widgets/custom_snackbar.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  final _dniController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _cargando = false;
  bool _obscureText = true;

  Future<void> _iniciarSesion() async {

   
    if (!_formKey.currentState!.validate()) return;

    setState(() => _cargando = true);

    final result = await AuthService.login(
      dni: _dniController.text,
      contrasena: _passwordController.text,
    );

    setState(() => _cargando = false);

    if (!mounted) return;

    if (result["ok"]) {
      mostrarSnackBar(
        context,
        result["data"]["mensaje"] ?? "Bienvenido",
        color: Colors.green,
      );

      Navigator.pushReplacementNamed(context, '/notas');
    } else {
      mostrarSnackBar(context, result["mensaje"]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Icon(Icons.school, size: 80, color: Colors.blueAccent),
                const SizedBox(height: 20),
                const Text(
                  "Bienvenido profesor/a",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),

                TextFormField(
                  controller: _dniController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "DNI",
                    prefixIcon: Icon(Icons.badge_outlined),
                  ),
                  validator: (v) =>
                      v == null || v.isEmpty ? "Ingrese su DNI" : null,
                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelText: "Contraseña",
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () =>
                          setState(() => _obscureText = !_obscureText),
                    ),
                  ),
                  validator: (v) =>
                      v == null || v.isEmpty ? "Ingrese su contraseña" : null,
                ),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: _cargando
                      ? const Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                          onPressed: _iniciarSesion,
                          child: const Text("Iniciar Sesión"),
                        ),
                ),

                TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const RegisterScreen()),
                    );
                  },
                  icon: const Icon(Icons.app_registration),
                  label: const Text(
                    "Registrar materia y contraseña",
                    style: TextStyle(fontSize: 16),
                  ),
                ),

                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
