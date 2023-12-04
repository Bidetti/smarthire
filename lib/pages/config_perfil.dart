import 'package:flutter/material.dart';

void main() {
  runApp(const Config());
}

class Config extends StatelessWidget {
  const Config({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProfileSettingsScreen(),
    );
  }
}

class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProfileSettingsScreenState createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo
            Image.asset(
              'assets/smarthire_branco.png',
              width: 150.0,
              height: 150.0,
            ),
            const SizedBox(height: 20.0),

            // Foto de Perfil
            const CircleAvatar(
              radius: 70.0,
              backgroundImage: AssetImage('assets/profile_image.png'),
            ),
            const SizedBox(height: 10.0),

            // Botão "Editar foto de perfil"
            ElevatedButton.icon(
              onPressed: () {
                // logica de edição da foto aqui
              },
              icon: const Icon(Icons.edit),
              label: const Text('Editar foto de perfil'),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Nome Completo
                  Container(
                    width: double.infinity, // Ocupa toda a largura disponível
                    child: const Align(
                      alignment: Alignment.center,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Alterar Nome Completo',
                          prefixIcon: Icon(Icons.edit),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),

                  Container(
                    width: double.infinity,
                    child: const Align(
                      alignment: Alignment.center,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Alterar celular',
                          prefixIcon: Icon(Icons.edit),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),

                  Container(
                    width: double.infinity,
                    child: const Align(
                      alignment: Alignment.center,
                      child: TextField(
                        maxLines: 3,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Alterar Bio',
                          prefixIcon: Icon(Icons.edit),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),

                  // Novo Column para os botões "Salvar" e "Voltar"
                  Column(
                    children: [
                      // Botão de Salvar
                      ElevatedButton(
                        onPressed: () {
                          // lógica para salvar as informações aqui
                        },
                        child: const Text('Salvar'),
                      ),
                      const SizedBox(height: 20.0),
                      // Botão de Voltar
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Voltar'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 4, 34, 168),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/notificacoes');
              },
              child: const Icon(Icons.notifications, color: Colors.white),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/home');
              },
              child: const Icon(Icons.home, color: Colors.white),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/perfil');
              },
              child: const Icon(Icons.person, color: Colors.white),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/indicacao');
              },
              child: const Icon(Icons.assignment_ind, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
