import 'package:flutter/material.dart';

class RememberPasswordForm extends StatefulWidget {
  @override
  RememberPasswordFormState createState() => RememberPasswordFormState();
}

class RememberPasswordFormState extends State<RememberPasswordForm> {
  final TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void _rememberPasswordInitializer() {
    //Lógica del remember password

  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            Text(
              'Recordar clave',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Email *',
                  hintText: 'Introduzca su email de acceso.'),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Campo requerido";
                }
                final bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value);
                if (!emailValid) {
                  return "Email con formato no válido";
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      _rememberPasswordInitializer();
                      Navigator.of(context).pop(); // Cerrar el diálogo
                    }                 
                  },
                  child: Text('Aceptar'),
                ),
                Spacer(),
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
    );
  }
}
