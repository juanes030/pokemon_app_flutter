import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil de Entrenador"),
        centerTitle: true,
        backgroundColor: Colors.orange.shade800,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person_pin_circle,
                size: 90,
                color: Colors.orange.shade600,
              ),
              const SizedBox(height: 20),
              // Título principal
              Text(
                "¡Tu viaje comienza pronto!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown.shade700,
                ),
              ),
              const SizedBox(height: 10),
              // Mensaje de proximidad
              const Text(
                "Estamos construyendo tu página de perfil, medallas y estadísticas. ¡Prepárate para ser el mejor entrenador!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}