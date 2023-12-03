import 'package:flutter/material.dart';

class CategoriasMenu extends StatelessWidget {
  const CategoriasMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Diminuir o tamanho do logo
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.5,
                child: Image.asset('assets/smarthire_branco.png'),
              ),
              const SizedBox(height: 0.1), // Aumentar a altura do espaço
              const Text(
                'Principais Categorias',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildCategoryButton(
                    context,
                    Icons.handyman,
                    'Pedreiro',
                    '/horario',
                  ),
                  buildCategoryButton(
                    context,
                    Icons.cleaning_services,
                    'Diarista',
                    '/exercicios',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildCategoryButton(
                    context,
                    Icons.man,
                    'Eletricista',
                    '/ranking',
                  ),
                  buildCategoryButton(
                    context,
                    Icons.class_,
                    'Professor',
                    '/monitor',
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
                Navigator.of(context).pushReplacementNamed('/indicação');
              },
              child: const Icon(Icons.assignment_ind, color: Colors.white),
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
      width: MediaQuery.of(context).size.width * 0.35,
      height: MediaQuery.of(context).size.width * 0.35,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26),
            color: const Color.fromRGBO(72, 70, 70, 1),
          ),
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(route);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                  size: MediaQuery.of(context).size.width * 0.15,
                ),
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.035,
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
