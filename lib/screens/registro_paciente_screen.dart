import 'package:flutter/material.dart';
import 'historial_medico_screen.dart';
import '../models/paciente_model.dart';

class RegistroPacienteScreen extends StatefulWidget {
  const RegistroPacienteScreen({super.key});

  @override
  State<RegistroPacienteScreen> createState() => _RegistroPacienteScreenState();
}

class _RegistroPacienteScreenState extends State<RegistroPacienteScreen> {
  final _formKey = GlobalKey<FormState>();
  String _sexo = 'Femenino';
  DateTime? _fechaNacimiento;

  final nombreController = TextEditingController();
  final apellidoController = TextEditingController();
  final edadController = TextEditingController();
  final direccionController = TextEditingController();
  final telefonoController = TextEditingController();
  final correoController = TextEditingController();

  final emergenciaNombreController = TextEditingController();
  final emergenciaTelefonoController = TextEditingController();
  final emergenciaParentescoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),

                const SizedBox(height: 12),
                Text(
                  'REGISTRO NUEVO',
                  style: Theme.of(context).textTheme.titleLarge,
                ),

                const SizedBox(height: 20),
                _buildInput('Nombre', nombreController),
                const SizedBox(height: 10),
                _buildInput('Apellido', apellidoController),

                const SizedBox(height: 16),
                const Text('Sexo:'),
                Row(
                  children: [
                    Radio<String>(
                      value: 'Femenino',
                      groupValue: _sexo,
                      onChanged: (value) => setState(() => _sexo = value!),
                    ),
                    const Text('Femenino'),
                    Radio<String>(
                      value: 'Masculino',
                      groupValue: _sexo,
                      onChanged: (value) => setState(() => _sexo = value!),
                    ),
                    const Text('Masculino'),
                  ],
                ),

                _buildInput('Edad', edadController),
                const SizedBox(height: 10),

                const Text('Fecha de nacimiento:'),
                const SizedBox(height: 4),
                InkWell(
                  onTap: _seleccionarFecha,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      _fechaNacimiento == null
                          ? 'Seleccionar fecha'
                          : '${_fechaNacimiento!.day}/${_fechaNacimiento!.month}/${_fechaNacimiento!.year}',
                      style: const TextStyle(color: Colors.black87),
                    ),
                  ),
                ),

                const SizedBox(height: 10),
                _buildInput('Dirección', direccionController),
                _buildInput('Teléfono', telefonoController),
                _buildInput('Correo', correoController),

                const SizedBox(height: 24),
                Text(
                  'Contacto de emergencia:',
                  style: Theme.of(context).textTheme.titleMedium,
                ),

                const SizedBox(height: 10),
                _buildInput('Nombre', emergenciaNombreController),
                _buildInput('Teléfono', emergenciaTelefonoController),
                _buildInput('Parentesco', emergenciaParentescoController),

                const SizedBox(height: 24),

                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final nuevoPaciente = PacienteModel(
                          nombre: nombreController.text,
                          apellido: apellidoController.text,
                          edad: edadController.text,
                          sexo: _sexo,
                          fechaNacimiento: _fechaNacimiento?.toIso8601String() ?? '',
                          direccion: direccionController.text,
                          telefono: telefonoController.text,
                          correo: correoController.text,
                          contactoEmergenciaNombre: emergenciaNombreController.text,
                          contactoEmergenciaTelefono: emergenciaTelefonoController.text,
                          contactoEmergenciaParentesco: emergenciaParentescoController.text,
                        );

                        pacientesRegistrados.add(nuevoPaciente);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const HistorialMedicoScreen(),
                          ),
                        );
                      }
                    },

                    child: const Text('GUARDAR'),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInput(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(labelText: label),
        validator: (value) =>
            value == null || value.isEmpty ? 'Campo requerido' : null,
      ),
    );
  }

  void _seleccionarFecha() async {
    final now = DateTime.now();
    final seleccionada = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(1900),
      lastDate: now,
    );

    if (seleccionada != null) {
      setState(() => _fechaNacimiento = seleccionada);
    }
  }
}
