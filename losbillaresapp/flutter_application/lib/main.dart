import 'package:flutter/material.dart';

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

  void _register() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () {
                              Navigator.of(context).pop(); // Cerrar el diálogo
                            },
                          ),
                        ],
                      ),
                      Text(
                        'Registro',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Código Autorización *',
                          hintText:
                              'Código aut. dado por Los billares',
                          hintStyle: TextStyle(
                              color: Colors.grey), // Cambiar el color del hint
                          
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        decoration: InputDecoration(labelText: 'Nombre *'),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        decoration: InputDecoration(labelText: 'Apellidos *'),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        decoration: InputDecoration(labelText: 'DNI'),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        decoration: InputDecoration(labelText: 'Email *'),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        decoration: InputDecoration(labelText: 'Teléfono *'),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        decoration:
                            InputDecoration(labelText: 'Nº de colegiado'),
                      ),
                      SizedBox(height: 16),
                      DropdownButtonFormField(
                        items: [
                          DropdownMenuItem(
                              value: 'Médico', child: Text('Médico')),
                          DropdownMenuItem(
                              value: 'Enfermero', child: Text('Enfermero')),
                          DropdownMenuItem(
                              value: 'Celador', child: Text('Celador')),
                          DropdownMenuItem(
                              value: 'Médico residente',
                              child: Text('Médico residente')),
                          DropdownMenuItem(
                              value: 'Enfermero residente',
                              child: Text('Enfermero residente')),
                          DropdownMenuItem(value: 'Otro', child: Text('Otro')),
                        ],
                        onChanged: (value) {},
                        decoration: InputDecoration(labelText: 'Cargo *'),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        decoration: InputDecoration(labelText: 'Cliente *'),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        decoration: InputDecoration(labelText: 'Clave *'),
                        obscureText: true,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Mínimo 8 caracteres alfanuméricos',
                        textAlign: TextAlign.left,
                      ),
                      TextField(
                        decoration:
                            InputDecoration(labelText: 'Repetir clave *'),
                        obscureText: true,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Términos y condiciones',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Responsable: LOS BILLARES CATERING, S.L.',
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        'Finalidad: Llevar a cabo el registro del usuario en la página web.',
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        'Legitimación: Consentimiento del interesado para registrarse en la página web.',
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        'Derechos: Tiene derecho a acceder, rectificar y suprimir los datos, así como otros derechos, como se explica en la información adicional.',
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        'Información adicional: Puede consultar la información adicional en el siguiente enlace.',
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Checkbox(value: false, onChanged: (value) {}),
                          Expanded(
                            child: Text(
                              'He leído y aceptado las condiciones',
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Aquí puedes agregar la lógica para registrar al usuario
                              Navigator.of(context).pop(); // Cerrar el diálogo
                            },
                            child: Text('Aceptar'),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Cerrar el diálogo
                            },
                            child: Text('Cancelar'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
                onTap: _register,
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
