import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'registro_paciente_screen.dart';

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
      backgroundColor: AppColors.primaryBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // BOTÓN DE REGRESO
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),

                const SizedBox(height: 12),
                const Text(
                  'REGISTRO NUEVO',
                  style: TextStyle(
                    color: AppColors.inputFieldColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),
                _buildInput('Nombre', nombreController),
                const SizedBox(height: 10),
                _buildInput('Apellido', apellidoController),

                const SizedBox(height: 16),
                const Text('Sexo:', style: TextStyle(color: Colors.white)),
                Row(
                  children: [
                    Radio<String>(
                      value: 'Femenino',
                      groupValue: _sexo,
                      onChanged: (value) => setState(() => _sexo = value!),
                    ),
                    const Text('Femenino', style: TextStyle(color: Colors.white)),
                    Radio<String>(
                      value: 'Masculino',
                      groupValue: _sexo,
                      onChanged: (value) => setState(() => _sexo = value!),
                    ),
                    const Text('Masculino', style: TextStyle(color: Colors.white)),
                  ],
                ),

                _buildInput('Edad', edadController),
                const SizedBox(height: 10),

                const Text('Fecha de nacimiento:', style: TextStyle(color: Colors.white)),
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
                const Text(
                  'Contacto de emergencia:',
                  style: TextStyle(
                    color: AppColors.inputFieldColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                _buildInput('Nombre:', emergenciaNombreController),
                _buildInput('Teléfono:', emergenciaTelefonoController),
                _buildInput('Parentesco:', emergenciaParentescoController),

                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.inputFieldColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Guardar paciente (lógica futura)
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Paciente registrado')),
                        );
                      }
                    },
                    child: const Text(
                      'GUARDAR',
                      style: TextStyle(color: Colors.white),
                    ),
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
        style: const TextStyle(color: Colors.black87),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white),
          filled: true,
          fillColor: Colors.white.withOpacity(0.9),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
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
