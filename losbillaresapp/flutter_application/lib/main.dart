import 'package:flutter_application/screens/change_menu_screen.dart';
import 'package:flutter_application/screens/login_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_application/screens/main_selection_menu_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      //home: MainSelectionMenuScreen(response: http.Response('Custom Response', 200)),
      //home: ChangeMenuScreen(dateTime: DateTime.now()),
    );
  }
}
