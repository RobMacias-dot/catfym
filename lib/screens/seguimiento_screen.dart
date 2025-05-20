import 'package:flutter/material.dart';

class SeguimientoScreen extends StatelessWidget {
  const SeguimientoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seguimiento de Pacientes'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Aquí se mostrará la lista de pacientes registrados'),
      ),
    );
  }
}
