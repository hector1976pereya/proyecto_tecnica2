import 'package:flutter/material.dart';
import 'screens/login_screen.dart'; 
import 'screens/carga_notas_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registro para docente',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true, 
      ),
      // Definimos la ruta inicial como el Login
      initialRoute: '/', 
      routes: {
        '/': (context) => const LoginScreen(), // Pantalla principal al abrir la app
        '/notas': (context) => const RegistroNotas(), // Pantalla de destino
      },
    );
  }
}