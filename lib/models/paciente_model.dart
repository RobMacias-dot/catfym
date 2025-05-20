import 'historial_medico.dart';

class PacienteModel {
  final String nombre;
  final String apellido;
  final String edad;
  final String sexo;
  final String fechaNacimiento;
  final String direccion;
  final String telefono;
  final String correo;
  final String contactoEmergenciaNombre;
  final String contactoEmergenciaTelefono;
  final String contactoEmergenciaParentesco;
  HistorialMedico? historialMedico;

  PacienteModel({
    required this.nombre,
    required this.apellido,
    required this.edad,
    required this.sexo,
    required this.fechaNacimiento,
    required this.direccion,
    required this.telefono,
    required this.correo,
    required this.contactoEmergenciaNombre,
    required this.contactoEmergenciaTelefono,
    required this.contactoEmergenciaParentesco,
    this.historialMedico,
  });
}

// 👇 Lista local de pacientes (¡debe estar FUERA de la clase!)
List<PacienteModel> pacientesRegistrados = [];