import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/registro_paciente_screen.dart';

void main() {
  runApp(const CatfymApp());
}

class CatfymApp extends StatelessWidget {
  const CatfymApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CATFYM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Arial',
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      // Cambia esta línea para probar la pantalla que desees
      home: LoginScreen(),
      // home: HomeScreen(nombreTerapeuta: 'Cristina Veloz', tienePacientes: true),
      // home: RegistroPacienteScreen(),
    );
  }
}