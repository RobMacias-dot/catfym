import 'package:flutter/material.dart';
import '../models/historial_medico.dart';
import '../models/paciente_model.dart';

class HistorialMedicoScreen extends StatefulWidget {
  const HistorialMedicoScreen({super.key});

  @override
  State<HistorialMedicoScreen> createState() => _HistorialMedicoScreenState();
}

class _HistorialMedicoScreenState extends State<HistorialMedicoScreen> {
  final _formKey = GlobalKey<FormState>();

  final enfermedadesController = TextEditingController();
  final medicinaController = TextEditingController();
  final lesionesController = TextEditingController();
  final cirugiasController = TextEditingController();
  final alergiasController = TextEditingController();

  bool usaAsistencia = false;

  final Map<String, bool> tratamientos = {
    'Medicamentos': false,
    'Fisioterapia': false,
    'Cirugía': false,
    'Ninguna': false,
  };

  void _guardarHistorial() {
    if (_formKey.currentState!.validate()) {
      final seleccionados = tratamientos.entries
          .where((entry) => entry.value && entry.key != 'Ninguna')
          .map((entry) => entry.key)
          .toList();

      final historial = HistorialMedico(
        enfermedadesCronicas: enfermedadesController.text,
        tomaMedicina: medicinaController.text,
        lesionesPrevias: lesionesController.text,
        cirugias: cirugiasController.text,
        alergias: alergiasController.text,
        usaAsistencia: usaAsistencia,
        tratamientosPrevios: tratamientos['Ninguna'] == true ? ['Ninguna'] : seleccionados,
      );

      if (pacientesRegistrados.isNotEmpty) {
        pacientesRegistrados.last.historialMedico = historial;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Historial médico guardado y vinculado.')),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Historial Médico')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildPregunta('Enfermedades crónicas', enfermedadesController),
              _buildPregunta('Toma medicamentos', medicinaController),
              _buildPregunta('Lesiones previas', lesionesController),
              _buildPregunta('Cirugías u hospitalizaciones', cirugiasController),
              _buildPregunta('Alergias', alergiasController),

              const SizedBox(height: 16),
              const Text('Usa dispositivos de asistencia:'),
              SwitchListTile(
                title: const Text('Usa asistencia'),
                value: usaAsistencia,
                onChanged: (value) => setState(() => usaAsistencia = value),
              ),

              const SizedBox(height: 16),
              const Text('Tratamientos previos recibidos:'),
              ...tratamientos.keys.map((key) {
                return CheckboxListTile(
                  title: Text(key),
                  value: tratamientos[key],
                  onChanged: (value) {
                    setState(() {
                      tratamientos[key] = value!;
                      if (key == 'Ninguna' && value) {
                        tratamientos.updateAll((k, v) => k == 'Ninguna');
                      } else if (key != 'Ninguna' && value) {
                        tratamientos['Ninguna'] = false;
                      }
                    });
                  },
                );
              }).toList(),

              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _guardarHistorial,
                child: const Text('GUARDAR'),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPregunta(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(labelText: label),
        validator: (value) => null,
      ),
    );
  }
}