import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String nombre;

  const CustomAppBar({super.key, required this.nombre});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.account_circle_rounded, size: 32),
        color: const Color(0xFF276CE4),
        onPressed: () {},
      ),
      title: Text(
        "Hola $nombre 👋",
        style: const TextStyle(
          color: Color(0xFF276CE4),
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
      elevation: 2,
      shadowColor: Colors.black26,
      backgroundColor: const Color.fromARGB(255, 231, 227, 227),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_outlined),
          onPressed: () {},
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.redAccent),
              foregroundColor: Colors.redAccent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
            onPressed: () {},
            child: const Text("Salir"),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}