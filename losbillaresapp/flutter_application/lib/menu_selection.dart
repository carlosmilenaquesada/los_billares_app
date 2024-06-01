import 'package:flutter/material.dart';

class MenuSelection extends StatefulWidget {
  @override
  State<MenuSelection> createState() => _MenuSelection();
}

class _MenuSelection extends State<MenuSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Centros de Salud'),
      ),
      backgroundColor: Colors.white, // Cambia el color de fondo a blanco
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Color.fromARGB(255, 252, 248, 227),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          'NOTA:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          '- En la elaboración de todos nuestros platos no usamos ningún tipo de conservante (el sistema de conservación es envasado en atmósfera modificada), potenciador de sabor ni aditivo. No obstante algún ingrediente que compramos puede que contenga algún tipo de aditivo que debemos de reflejar en el etiquetado pero no es un añadido nuestro.',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          '-En cuanto al pan hemos introducido la opción de poder elegir pan integral y habilitado la opción de seleccionar el tipo de pan tanto en el almuerzo como en la cena. Si tiene almuerzo y cena y desea realizar cambio de pan no olvide marcarlo tanto en el almuerzo como en la cena. Si elige cualquier opción que no sea la de bollito de pan normal (palillos, palillos integrales o pan integral) no es necesario que lo indique también en las observaciones.',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'Les recordamos que trabajamos con un precio de menú cerrado y no siempre podremos atender todas las peticiones recibidas.',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'Un cordial saludo,',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          'LB Catering',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
