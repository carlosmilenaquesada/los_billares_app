import 'package:flutter/material.dart';
import 'package:flutter_application/forms.dart';

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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    // Aquí va el código para manejar el login
    print('Email: ${_emailController.text}');
    print('Password: ${_passwordController.text}');
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
    // Aquí va el código para manejar la recuperación de clave
    print('¿Olvidaste tu clave?');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Centros de Salud'),
      ),
      backgroundColor: Colors.white, // Cambia el color de fondo a blanco
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
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
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Clave',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                textStyle: TextStyle(fontSize: 18),
              ),
              onPressed: _login,
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
      ),
    );
  }
}
