import 'package:flutter/material.dart';
import '../widgets/animated_background.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const AnimatedBackground(),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 30),

                    // Logo
                    Center(
                      child: Image.asset(
                        'assets/catfym_logo_bco.png',
                        height: 100,
                      ),
                    ),

                    const SizedBox(height: 40),
                    const Text('USUARIO:'),
                    const SizedBox(height: 4),

                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Este campo es obligatorio';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 20),
                    const Text('CONTRASEÑA:'),
                    const SizedBox(height: 4),

                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Este campo es obligatorio';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 30),

                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(
                                nombreTerapeuta: emailController.text.split('@')[0],
                                tienePacientes: false,
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Completa todos los campos')),
                          );
                        }
                      },
                      child: const Text('INICIAR SESIÓN'),
                    ),

                    const SizedBox(height: 20),

                    TextButton(
                      onPressed: () {},
                      child: const Text('RECUPERAR CONTRASEÑA'),
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
