import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegionsScreen extends ConsumerWidget {
  const RegionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Regiones"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icono temático de mapa o viaje
              Icon(
                Icons.travel_explore,
                size: 90,
                color: Colors.blueAccent.shade400,
              ),
              const SizedBox(height: 20),
              // Título principal
              Text(
                "¡Explorando nuevas tierras!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey.shade800,
                ),
              ),
              const SizedBox(height: 10),
              // Mensaje de proximidad
              const Text(
                "La base de datos de regiones de Kanto, Johto y más está en camino. ¡Vuelve pronto para planificar tu próxima aventura Pokémon!",
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