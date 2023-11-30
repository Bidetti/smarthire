import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smarthire/pages/parme/categorias.dart';
import 'package:smarthire/pages/login.dart';


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
      title: 'Home',
      initialRoute: '/',
      routes: {
        '/': (context) => const CategoriasMenu(),
      },
    );
  }
}
