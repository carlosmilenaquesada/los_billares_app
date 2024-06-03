import 'package:flutter/material.dart';

class ChangeMenuScreen extends StatefulWidget {
  late DateTime dateTime;

  ChangeMenuScreen({required this.dateTime});
  @override
  ChangeMenuScreenState createState() => ChangeMenuScreenState();
}

class ChangeMenuScreenState extends State<ChangeMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modificación de menú'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                color: Color(0xFFCCCCCC),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Icon(Icons.restaurant),
                          Text(
                            "Menú establecido del día",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text("dateTime")
                  ],
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
