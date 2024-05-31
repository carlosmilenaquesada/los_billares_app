import 'package:flutter/material.dart';

class SingUpForm extends StatefulWidget {
  @override
  State<SingUpForm> createState() => _SingUpFormState();
}

class _SingUpFormState extends State<SingUpForm> {
  late String authCode;
  late String name;
  late String lastName;
  late String dni;
  late String email;
  late String phoneNumber;
  late String memberNumber;
  String jobPosition = "2";
  String customer = "2";
  late String password;
  late String repeatPassword;
  bool acceptedConditions = false;

  GlobalKey formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
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
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Código Autorización *',
                    hintText: 'Código aut. dado por Los billares',
                    hintStyle: TextStyle(
                        color: Colors.grey), // Cambiar el color del hint
                  ),
                  onSaved: (value) {
                    authCode = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Campo requerido";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nombre *'),
                  onSaved: (value) {
                    name = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Campo requerido";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Apellidos *'),
                  onSaved: (value) {
                    lastName = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Campo requerido";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'DNI'),
                  onSaved: (value) {
                    dni = value!;
                  },
                  validator: (value) {
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email *'),
                  onSaved: (value) {
                    email = value!;
                  },
                  keyboardType: TextInputType.emailAddress,
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
                TextFormField(
                  decoration: InputDecoration(labelText: 'Teléfono *'),
                  onSaved: (value) {
                    phoneNumber = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Campo requerido";
                    }
                    final bool phoneNumberValid =
                        RegExp(r'^\+?[0-9]{7,15}$').hasMatch(value);
                    if (!phoneNumberValid) {
                      return "Teléfono con formato no válido (no incluir espacios)";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nº de colegiado'),
                  onSaved: (value) {
                    memberNumber = value!;
                  },
                  validator: (value) {
                    return null;
                  },
                ),
                DropdownButtonFormField(
                    value: jobPosition,
                    items: [
                      DropdownMenuItem(value: "2", child: Text("Médico")),
                      DropdownMenuItem(value: "3", child: Text("Enfermero")),
                      DropdownMenuItem(value: "4", child: Text("Celador")),
                      DropdownMenuItem(
                          value: "1", child: Text("Médico residente")),
                      DropdownMenuItem(
                          value: "5", child: Text("Enfermero residente")),
                      DropdownMenuItem(value: "0", child: Text("Otro")),
                    ],
                    onChanged: (value) {
                      jobPosition = value!;
                    },
                    decoration: InputDecoration(labelText: 'Cargo *')),
                DropdownButtonFormField(
                    value: customer,
                    items: [
                      DropdownMenuItem(value: "2", child: Text("SAS Córdoba")),
                      DropdownMenuItem(value: "3", child: Text("SAS Málaga")),
                      DropdownMenuItem(value: "18", child: Text("061 Málaga")),
                      DropdownMenuItem(value: "9", child: Text("SAS Jaén")),
                      DropdownMenuItem(value: "14", child: Text("SAS Cádiz")),
                      DropdownMenuItem(
                          value: "19", child: Text("Reparto a domicilio")),
                      DropdownMenuItem(
                          value: "22", child: Text("Clínica Doctor Galán")),
                      DropdownMenuItem(
                          value: "23", child: Text("Asistencia Los Ángeles")),
                      DropdownMenuItem(value: "25", child: Text("061 Cádiz")),
                      DropdownMenuItem(value: "27", child: Text("SAS Granada")),
                    ],
                    onChanged: (value) {
                      customer = value!;
                    },
                    decoration: InputDecoration(labelText: 'Cliente *')),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Clave *'),
                  onSaved: (value) {
                    password = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Campo requerido";
                    }
                    String message = "";
                    if (value.length < 8) {
                      message = "La clave debe tener 8 caracteres mínimo";
                    }

                    if (!RegExp(r'[a-z]', caseSensitive: false)
                        .hasMatch(value)) {
                      message += "La clave debe contener al menos una letra";
                    }

                    if (!RegExp(r'[A-Z]').hasMatch(value)) {
                      message +=
                          "La clave debe contener al menos una mayúscula";
                    }
                    if (!RegExp(r'\d').hasMatch(value)) {
                      message += "La clave debe contener al menos un número";
                    }
                    if (message.isEmpty) {
                      return null;
                    } else {
                      return message;
                    }
                  },
                ),
                Text(
                  'Mínimo 8 caracteres alfanuméricos',
                  textAlign: TextAlign.left,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Repetir clave *'),
                  onSaved: (value) {
                    repeatPassword = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Campo requerido";
                    }
                    if (value != password) {
                      return "La clave repetida es distinta a la inicial";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: [
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
                    ],
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                        value: acceptedConditions,
                        onChanged: (value) {
                          acceptedConditions = !acceptedConditions;
                          value = acceptedConditions;
                        }),
                    Text("He leído y aceptado las condiciones."),
                  ],
                ),
                SizedBox(height: 40),
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
    );
  }
}
