import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

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
              // ICONOS SUPERIORES
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.person, color: Colors.white),
                    onPressed: () {
                      // Ir al perfil
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings, color: Colors.white),
                    onPressed: () {
                      // Ir a configuración
                    },
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // BIENVENIDA
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
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.inputFieldColor,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              // BOTÓN: REGISTRAR NUEVO PACIENTE
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.inputFieldColor,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  // Navegar a registro de paciente
                },
                child: const Text(
                  'REGISTRAR NUEVO PACIENTE',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // BOTÓN: DAR SEGUIMIENTO (condicional)
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
                        // Navegar a seguimiento
                      }
                    : null,
                child: const Text(
                  'DAR SEGUIMIENTO',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const Spacer(),

              // LOGO CATFYM AL FONDO
              Center(
                child: Image.asset(
                  'assets/logo_catfym.png',
                  height: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}