import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
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
      backgroundColor: AppColors.primaryBackground,
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
                    icon: const Icon(Icons.person, color: Colors.white),
                    onPressed: () {
                      // Acción perfil
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings, color: Colors.white),
                    onPressed: () {
                      // Acción configuración
                    },
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
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 12),

              const Text(
                '¿Qué deseas hacer?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.inputFieldColor,
                  fontWeight: FontWeight.w600,
                ),
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.inputFieldColor,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'REGISTRAR NUEVO PACIENTE',
                  style: TextStyle(color: Colors.white),
                ),
              ),


              const SizedBox(height: 20),

              // Botón 2: Dar seguimiento
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      tienePacientes ? AppColors.inputFieldColor : Colors.grey,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
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

                child: const Text(
                  'DAR SEGUIMIENTO',
                  style: TextStyle(color: Colors.white),
                ),
              ),

              const Spacer(),

              // Logo inferior (opcional)
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