import 'package:flutter/material.dart';

void mostrarSnackBar(
  BuildContext context,
  String mensaje, {
  Color color = Colors.redAccent,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(mensaje),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
