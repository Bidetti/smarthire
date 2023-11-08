import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 
import 'package:smarthire/pages/login.dart';
import 'package:smarthire/pages/parme/categories_menu.dart';
import 'package:smarthire/pages/parme/perfil_contratante.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor:
          SystemUiOverlayStyle.dark.systemNavigationBarColor,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => PerfilContratante(),

      },
    );
  }
}
