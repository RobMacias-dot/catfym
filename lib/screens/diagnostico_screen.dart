import 'package:flutter/material.dart';

class DiagnosticoScreen extends StatelessWidget {
  const DiagnosticoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Diagnóstico'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Nombre del paciente'),
              const SizedBox(height: 8),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Ej. Juan Pérez',
                ),
              ),
              const SizedBox(height: 16),

              const Text('Síntomas / Observaciones'),
              const SizedBox(height: 8),
              const TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Describir síntomas o situación actual...',
                ),
              ),
              const SizedBox(height: 16),

              const Text('Adjuntar imagen (opcional)'),
              const SizedBox(height: 8),
              ElevatedButton.icon(
                onPressed: () {
                  // Aquí se integraría el selector de imágenes
                },
                icon: const Icon(Icons.camera_alt),
                label: const Text('Adjuntar foto'),
              ),

              const SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Guardar o validar diagnóstico
                  },
                  child: const Text('Guardar Diagnóstico'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}