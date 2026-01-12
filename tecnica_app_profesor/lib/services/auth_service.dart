import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';

class AuthService {

  // --------------------
  // LOGIN
  // --------------------
  static Future<Map<String, dynamic>> login({
    required String dni,
    required String contrasena,
  }) async {
    final url =
        Uri.parse("${ApiConfig.baseUrl}/auth-profesor/login");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "dni": dni,
          "contrasena": contrasena,
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return {
          "ok": true,
          "data": data, // token / datos usuario
        };
      } else {
        return {
          "ok": false,
          "mensaje": data["mensaje"] ?? "Credenciales incorrectas",
        };
      }
    } catch (e) {
      return {
        "ok": false,
        "mensaje": "No se pudo conectar con el servidor",
      };
    }
  }

  // --------------------
  // REGISTER
  // --------------------
  static Future<Map<String, dynamic>> register({
    required String dni,
    required String materia,
    required String curso,
    required String seccion,
    required String grupo,
    required String contrasena,
  }) async {
    final url =
        Uri.parse("${ApiConfig.baseUrl}/auth-profesor/register");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "dni": dni,
          "materia": materia,
          "curso": curso,
          "seccion": seccion,
          "grupo": grupo,
          "contrasena": contrasena,
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 201 || response.statusCode == 200) {
        return {"ok": true};
      } else {
        return {
          "ok": false,
          "mensaje": data["mensaje"] ?? "Error en el registro",
        };
      }
    } catch (e) {
      return {
        "ok": false,
        "mensaje": "Error de conexión",
      };
    }
  }
}
