import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smarthire/pages/auth/cadastro.dart';
import 'package:smarthire/pages/auth/login.dart';
import 'package:smarthire/pages/categorias.dart';
import 'package:smarthire/pages/config_perfil.dart';
import 'package:smarthire/pages/perfil.dart';
import 'package:smarthire/pages/projects.dart';
import 'package:smarthire/pages/ranking.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

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
      navigatorKey: navigatorKey,
      title: 'SmartHire',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/cadastro': (context) => const CadastroScreen(),
        '/home': (context) => const CategoriasScreen(),
        '/perfil-config': (context) => const ProfileSettingsScreen(),
        '/ranking': (context) => const RankingScreen(),
        '/perfil': (context) => const PerfilScreen(),
        '/projetos': (context) => const ProjectScreen(),
      },
    );
  }
}
