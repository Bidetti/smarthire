import 'package:flutter/material.dart';

class CategoriasMenu extends StatelessWidget {
  const CategoriasMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.asset('assets/smarthire_branco.png'), // Adicione o caminho para a sua imagem aqui
          const Text(
            'Principais Categorias',
            style: TextStyle(
              fontSize: 16, 
              fontWeight: FontWeight.normal, 
              color: Colors.black,
              decoration: TextDecoration.none,
              ),
          ),
          Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26),
                    color: const Color.fromRGBO(72, 70, 70, 1),
                  ),
                  width: 200,
                  height: 200,
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/horario');
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.handyman, color: Colors.white, size: 70),
                          Text('Pedreiro',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                              ),
                              textAlign: TextAlign.center),
                        ],
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26),
                    color: const Color.fromRGBO(72, 70, 70, 1),
                  ),
                  width: 200,
                  height: 200,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/exercicios');
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.cleaning_services,
                              color: Colors.white, size: 70),
                          Text('Diarista',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                              ),
                              textAlign: TextAlign.center),
                        ],
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26),
                    color: const Color.fromRGBO(72, 70, 70, 1),
                  ),
                  width: 200,
                  height: 200,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/ranking');
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.man, color: Colors.white, size: 70),
                          Text('Eletricista',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 26),
                              textAlign: TextAlign.center),
                        ],
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26),
                    color: const Color.fromRGBO(72, 70, 70, 1),
                  ),
                  width: 200,
                  height: 200,
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/monitor');
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.class_, color: Colors.white, size: 70),
                          Text('Professor',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 26),
                              textAlign: TextAlign.center),
                        ],
                      )),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
