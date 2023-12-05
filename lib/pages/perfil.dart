import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:smarthire/main.dart';
import 'package:smarthire/service/auth_service.dart';
import 'package:smarthire/service/users_service.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({Key? key}) : super(key: key);

  @override
  PerfilScreenState createState() => PerfilScreenState();
}

class PerfilScreenState extends State<PerfilScreen> {
  Map<String, dynamic> userData = {};

  @override
  void initState() {
    super.initState();
    _auth();
    initializeDateFormatting('pt_BR', null).then((_) => _loadUserData());
  }

  Future<void> _loadUserData() async {
    Uri uri = Uri.base;
    String urlid = uri.queryParameters['id'] ?? '';
    String email = '';
    String id = '';
    final prefs = await SharedPreferences.getInstance();
    if (urlid.isEmpty) {
      if (prefs.containsKey('userID')) {
        id = prefs.getString('userID') ?? '';
      } else if (prefs.containsKey('userEmail')) {
        email = prefs.getString('userEmail') ?? '';
      } else {
        _logout();
        showSnackBar('Erro: Não foi possível autenticar sua conexão.',
            Colors.red.shade700);
        return;
      }
    }
    if (id.isNotEmpty) {
      final user = await getUserByID(id);
      if (user != null) {
        userData = user;
      } else {
        _logout();
        showSnackBar('Erro: Não foi possível autenticar sua conexão.',
            Colors.red.shade700);
        return;
      }
    } else if (email.isNotEmpty) {
      final user = await getUserByEmail(email);
      if (user != null) {
        userData = user;
      } else {
        _logout();
        showSnackBar('Erro: Não foi possível autenticar sua conexão.',
            Colors.red.shade700);
        return;
      }
    } else if (urlid.isNotEmpty) {
      final user = await getUserByID(urlid);
      if (user != null) {
        userData = user;
      } else {
        navigatePushNamed('/home');
        showSnackBar(
            'Erro: Não foi possível encontrar o usuário.', Colors.red.shade700);
        return;
      }
    } else {
      navigatePushNamed('/home');
      showSnackBar(
          'Erro: Não foi possível encontrar o usuário.', Colors.red.shade700);
    }
    setState(() {});
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
    String formattedDate = '';
    if (userData['created_at'] != null) {
      DateTime parsedDate = DateTime.parse(userData['created_at']);
      formattedDate =
          DateFormat('d \'de\' MMMM \'de\' y', 'pt_BR').format(parsedDate);
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: 175.0,
                  width: 175.0,
                  child: Image.asset(
                    'assets/smarthire_branco.png',
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              const CircleAvatar(
                  radius: 45.0,
                  backgroundImage: AssetImage('assets/image_missing.png')),
              const SizedBox(height: 20.0),
              FutureBuilder<SharedPreferences>(
                future: SharedPreferences.getInstance(),
                builder: (BuildContext context,
                    AsyncSnapshot<SharedPreferences> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    String userID = snapshot.data?.getString('userID') ?? '';
                    if (userID == userData['_id']) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () async {
                              snapshot.data
                                  ?.setString('userID', userData['_id']);
                              navigatePushNamed('/perfil-config');
                            },
                            icon: const Icon(Icons.edit, color: Colors.black),
                            label: const Text('Editar Perfil',
                                style: TextStyle(color: Colors.black)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          ElevatedButton.icon(
                            onPressed: () {
                              _logout();
                              showSnackBar('Você foi desconectado com sucesso!',
                                  Colors.yellow.shade700);
                            },
                            icon: const Icon(Icons.exit_to_app,
                                color: Colors.black),
                            label: const Text('Sair',
                                style: TextStyle(color: Colors.black)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Container(); // Return an empty container if the IDs do not match
                    }
                  } else {
                    return const CircularProgressIndicator(); // Show a loading spinner while waiting for SharedPreferences to load
                  }
                },
              ),
              const SizedBox(height: 20.0),
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        'Nome: ${userData['nomeCompleto']}',
                        style: const TextStyle(
                          fontSize: 13.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        'Idade: ${userData['idade']}', // Substitua pelo valor real
                        style: const TextStyle(
                          fontSize: 13.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Text(
                        'Projetos Participados: 10', // Substitua pelo valor real
                        style: TextStyle(
                          fontSize: 13.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        'Membro desde: $formattedDate',
                        style: const TextStyle(
                          fontSize: 13.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Área de Projetos:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 15.0),
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    // Adicione a imagem
                    Widget image = CircleAvatar(
                      radius: constraints.maxWidth < 200 ? 15.0 : 20.0,
                      backgroundImage:
                          const AssetImage('assets/image_missing.png'),
                    );
                    Widget nameAndStatus = const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Reboque na parede',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Ativo',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    );
                    Widget clockIcon = const Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: Colors.grey,
                          size: 12,
                        ),
                        SizedBox(width: 5),
                        // Adicione a data
                        Text(
                          '01/01/2023',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    );

                    Widget projectValue = const Text(
                      'R\$ 1.000,00',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    );
                    return constraints.maxWidth < 600
                        ? Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [image, nameAndStatus],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [clockIcon, projectValue],
                              ),
                            ],
                          )
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              image,
                              const SizedBox(width: 10),
                              nameAndStatus,
                              const Spacer(),
                              clockIcon,
                              const SizedBox(width: 10),
                              projectValue,
                            ],
                          );
                  },
                ),
              ),
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
}
