import 'package:flutter/material.dart';
import 'package:smarthire/main.dart';
import 'package:smarthire/service/auth_service.dart';

class CategoriasScreen extends StatefulWidget {
  const CategoriasScreen({Key? key}) : super(key: key);

  @override
  CategoriasScreenState createState() => CategoriasScreenState();
}

class CategoriasScreenState extends State<CategoriasScreen> {
  @override
  void initState() {
    super.initState();
    _auth();
  }

  Future<void> _logout() async {
    logoutUser();
    navigatePushNamed('/');
  }

  Future<bool> _auth() async {
    final jwt = await verifyJWT();
    if (jwt == true) {
      return true;
    }
    _logout();
    showSnackBar('Erro: Não foi possível autenticar sua conexão.', Colors.red);
    return false;
  }

  void showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }

  void navigatePushNamed(String route, {Object? arguments}) {
    if (mounted && navigatorKey.currentState != null) {
      navigatorKey.currentState?.pushNamed(route, arguments: arguments);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset('assets/smarthire_branco.png'),
              const SizedBox(height: 0.1),
              const Text(
                'Principais Categorias',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildCategoryButton(
                    context,
                    Icons.handyman,
                    'Pedreiro',
                    'Pedreiro',
                  ),
                  buildCategoryButton(
                    context,
                    Icons.flash_on,
                    'Eletricista',
                    'Eletricista',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildCategoryButton(
                    context,
                    Icons.plumbing,
                    'Encanador',
                    'Encanador',
                  ),
                  buildCategoryButton(
                    context,
                    Icons.class_,
                    'Professor',
                    'Professor',
                  ),
                ],
              ),
              const SizedBox(
                  height: 20), // Espaço entre as categorias e o rodapé
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 4, 34, 168),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                navigatePushNamed('/home');
              },
              child: const Icon(Icons.home, color: Colors.white),
            ),
            InkWell(
              onTap: () {
                navigatePushNamed('/projetos');
              },
              child: const Icon(Icons.folder, color: Colors.white),
            ),
            InkWell(
              onTap: () {
                navigatePushNamed('/ranking');
              },
              child: const Icon(Icons.star, color: Colors.white),
            ),
            InkWell(
              onTap: () {
                navigatePushNamed('/perfil');
              },
              child: const Icon(Icons.person, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryButton(
    BuildContext context,
    IconData icon,
    String label,
    String route,
  ) {
    return SizedBox(
      width: 190,
      height: 190,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26),
            color: const Color.fromRGBO(72, 70, 70, 1),
          ),
          child: TextButton(
            onPressed: () {
              navigatePushNamed('/ranking', arguments: route);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                  size: 100,
                ),
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
