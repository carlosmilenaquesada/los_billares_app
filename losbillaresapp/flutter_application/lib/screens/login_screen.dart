import 'package:flutter/material.dart';
import 'package:flutter_application/forms/remember_password_form.dart';
import 'package:flutter_application/forms/signup_form.dart';
import 'package:flutter_application/screens/main_selection_menu_screen.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final String url = 'http://cs.losbillares.com/operaciones/opLogin.php';

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _errorMessage = TextEditingController();

  Future<http.Response?> _getLoginResponse() async {
    http.Response? response;
    try {
      response = await http.post(Uri.parse(url), body: <String, String>{
        'email': _emailController.text,
        'clave': _passwordController.text
      });
    } catch (e) {
      _errorMessage.text = 'Excepción $e';
      setState(() {});
    }
    return response;
  }

  void _loginInitializer(BuildContext context) async {
    http.Response? response = await _getLoginResponse();
    if (response == null || response.statusCode != 302) {
      _errorMessage.text = 'Problemas al conectar con el servidor';
      setState(() {});
      return;
    }
    if (response.headers['location'] == '../index.php?error=1') {
      _errorMessage.text = 'Usuario o contraseña no son válidas.';
      setState(() {});

      return;
    }
    if (!context.mounted) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MainSelectionMenuScreen(response: response),
      ),
    );
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
            child: RememberPasswordForm(),
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
                    _errorMessage.clear();
                    setState(() {});
                    if (formKey.currentState!.validate()) {
                      _loginInitializer(context);
                    }
                  },
                  child: Text('Acceder'),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        _errorMessage.text,
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
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
