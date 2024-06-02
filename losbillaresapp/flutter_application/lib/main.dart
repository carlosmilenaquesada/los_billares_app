import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application/menu_selection.dart';

import 'package:flutter_application/remember_password.dart';
import 'package:flutter_application/signup_form.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController =
      TextEditingController(text: "raul@cano.net");
  final TextEditingController _passwordController =
      TextEditingController(text: "Demo2015");

  Future<void> _login() async {
    final String url = 'http://cs.losbillares.com/operaciones/opLogin.php';
    final Map<String, String> formData = {
      'email': _emailController.text,
      'clave': _passwordController.text,
    };

    try {
      final http.Response response = await http.post(
        Uri.parse(url),
        body: formData
      );
      print(response.headers);
    } catch (error) {
      print('Error: $error');
    }
  }

  void _showRegisterModal() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: SingleChildScrollView(
            child: SingUpForm(),
          ),
        );
      },
    );
  }

  void _forgotPassword() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: SingleChildScrollView(
            child: RememberPassword(),
          ),
        );
      },
    );
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Centros de Salud'),
      ),
      backgroundColor: Colors.white, // Cambia el color de fondo a blanco
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 250, // Cambia el tamaño de la imagen
                  child: Image.asset('assets/images/logo.jpg'),
                ),
                SizedBox(height: 16),
                Center(
                  child: Text(
                    'Centros de Salud',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Campo requerido";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Clave',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Campo requerido";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      _login();
                    }
                  },
                  child: Text('Acceder'),
                ),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: _showRegisterModal,
                    child: Text(
                      'Registrarme',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: GestureDetector(
                    onTap: _forgotPassword,
                    child: Text(
                      '¿Has olvidado la clave?',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
