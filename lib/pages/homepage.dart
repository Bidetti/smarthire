import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarthire/service/auth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _auth();
  }

  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('jwt');
  }

  Future<bool> _auth() async {
    final jwt = await verifyJWT();
    if (jwt == true) {
      return true;
    }
    navigatePushNamed('/');
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

  void navigatePushNamed(String route) {
    if (mounted) {
      Navigator.pushNamed(context, route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SmartHire'),
      ),
      body: const Center(
        child: Text('Home Page'),
      ),
    );
  }
}
