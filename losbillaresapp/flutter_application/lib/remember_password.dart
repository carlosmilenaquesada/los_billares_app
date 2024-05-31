import 'package:flutter/material.dart';

class RememberPassword extends StatefulWidget {
  @override
  State<RememberPassword> createState() => _RememberPassword();
}

class _RememberPassword extends State<RememberPassword> {
  late String email;

  @override
  Widget build(BuildContext context) {
    return Form(
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
              onSaved: (value) {
                email = value!;
              },
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
                    //Lógica de recordar contraseña
                    Navigator.of(context).pop(); // Cerrar el diálogo
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
