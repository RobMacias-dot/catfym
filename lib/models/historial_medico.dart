class HistorialMedico {
  final String enfermedadesCronicas;
  final String tomaMedicina;
  final String lesionesPrevias;
  final String cirugias;
  final String alergias;
  final bool usaAsistencia;
  final List<String> tratamientosPrevios;

  HistorialMedico({
    required this.enfermedadesCronicas,
    required this.tomaMedicina,
    required this.lesionesPrevias,
    required this.cirugias,
    required this.alergias,
    required this.usaAsistencia,
    required this.tratamientosPrevios,
  });
}
