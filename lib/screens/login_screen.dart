import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../widgets/animated_background.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const AnimatedBackground(), // Fondo curvo animado

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 30),

                    // LOGO Y TEXTO PRINCIPAL
                    /*Center(
                      child: Column(
                        children: const [
                          SizedBox(height: 20),
                          Text(
                            'CATFYM',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Centro de Atención de\nTerapia Física y Médica',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),*/

                    const SizedBox(height: 40),

                    Center(
                      child: Image.asset(
                        'assets/catfym_logo_bco.png',
                        height: 100,
                      ),
                    ),

                    // USUARIO
                    const Text('USUARIO:', style: TextStyle(color: Colors.white)),
                    const SizedBox(height: 4),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.inputFieldColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextFormField(
                        controller: emailController,
                        style: const TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Por favor ingresa tu usuario';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person, color: Colors.white),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // CONTRASEÑA
                    const Text('CONTRASEÑA:', style: TextStyle(color: Colors.white)),
                    const SizedBox(height: 4),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.inputFieldColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Por favor ingresa tu contraseña';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock, color: Colors.white),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // BOTÓN INICIAR SESIÓN
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Si todo está correcto, aquí navegas o haces login
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Campos validados. Iniciando sesión...'),
                            ),
                          );
                        }
                      },
                      child: const Text(
                        'INICIAR SESIÓN',
                        style: TextStyle(
                          color: AppColors.buttonTextColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // RECUPERAR CONTRASEÑA
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'RECUPERAR CONTRASEÑA',
                        style: TextStyle(
                          color: AppColors.secondaryText,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}