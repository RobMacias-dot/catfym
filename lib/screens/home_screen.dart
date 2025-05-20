import 'package:flutter/material.dart';
import 'registro_paciente_screen.dart';
import 'seguimiento_screen.dart';

class HomeScreen extends StatelessWidget {
  final String nombreTerapeuta;
  final bool tienePacientes;

  const HomeScreen({
    super.key,
    required this.nombreTerapeuta,
    required this.tienePacientes,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Puedes mantener el fondo si quieres conservar el color base
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Íconos de perfil y configuración
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.person),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () {},
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Logo centrado
              Center(
                child: Image.asset(
                  'assets/catfym_logo_bco.png',
                  height: 80,
                  errorBuilder: (context, error, stackTrace) =>
                      const Text('⚠️ No se pudo cargar el logo'),
                ),
              ),

              const SizedBox(height: 40),

              Text(
                'Bienvenida $nombreTerapeuta',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 12),

              const Text(
                '¿Qué deseas hacer?',
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              // Botón 1: Registrar nuevo paciente
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegistroPacienteScreen(),
                    ),
                  );
                },
                child: const Text('REGISTRAR NUEVO PACIENTE'),
              ),

              const SizedBox(height: 20),

              // Botón 2: Dar seguimiento
              ElevatedButton(
                onPressed: tienePacientes
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SeguimientoScreen(),
                          ),
                        );
                      }
                    : null,
                child: const Text('DAR SEGUIMIENTO'),
              ),

              const Spacer(),

              Center(
                child: Image.asset(
                  'assets/catfym_logo_bco.png',
                  height: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
