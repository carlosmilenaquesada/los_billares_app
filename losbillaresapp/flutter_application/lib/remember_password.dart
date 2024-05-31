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
      child: Column(
        children: [
          /*Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
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
              Form(
                child: Column(
                  children: [
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
                  ],
                ),
              ),
            ],
          ),*/
        ],
      ),
    );
  }
}
