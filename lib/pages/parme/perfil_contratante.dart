import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PerfilContratante extends StatelessWidget {
  const PerfilContratante({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: 100.0, // altura desejada
                width: 100.0, // largura desejada
                child: Image.asset(
                  'assets/smarthire_branco.png',
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20.0), // espaço desejado
                  child: Text(
                    'Editar perfil',
                    style: TextStyle(
                      color: Colors.black, // cor desejada
                      fontFamily: 'Arial',
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal,
                      fontSize: 15, // tamanho desejado
                    ),
                  ),
                ),
                Icon(Icons.edit),
              ],
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: .0), // espaço desejado
                child: Icon(
                  Icons.photo_camera,
                  size: 50.0, // tamanho desejado
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0), // espaço desejado
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Nome completo:',
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(10.0), // bordas arredondadas
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors.blue, width: 2.0), // cor azul
                    borderRadius:
                        BorderRadius.circular(10.0), // bordas arredondadas
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0), // espaço desejado
              child: SizedBox(
                width: 600.0, // largura desejada
                child: TextField(
                  minLines: 5, // altura mínima desejada
                  maxLines: 5, // altura máxima desejada
                  decoration: InputDecoration(
                    hintText: 'Biografia:', // texto de dica
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // bordas arredondadas
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.blue, width: 2.0), // cor azul
                      borderRadius:
                          BorderRadius.circular(10.0), // bordas arredondadas
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0), // espaço desejado
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Área de Projetos:', // texto desejado
                  style: TextStyle(
                    fontSize: 16.0, // tamanho desejado
                    color: Colors.black, // cor desejada
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
