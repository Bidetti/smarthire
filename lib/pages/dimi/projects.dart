import 'package:flutter/material.dart';



class Projects extends StatelessWidget {
  const Projects({ Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            children: [
              Image.asset('assets/smarthire_branco.png'), // Adicione o caminho para a sua imagem aqui
              const Text('Principais Categorias', 
                style: TextStyle(
                  fontSize: 24, 
                  fontWeight: FontWeight.normal, 
                  color: Color.fromARGB(255, 121, 134, 152), 
                  decoration: TextDecoration.none,),
              ),
                Wrap(
                  children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0), 
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26), 
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ), 
                      width: 200, 
                      height: 200, 
                      child: TextButton(
                        onPressed: (){
                          Navigator.pushNamed(context, '/exercicios');
                        }, 
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(Icons.hardware, color: Color.fromARGB(255, 0, 0, 0), size: 150),
                            Text('Pedreiro', style: TextStyle(color: Color.fromARGB(255, 121, 134, 152), fontSize: 26,), textAlign: TextAlign.center)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                          padding: const EdgeInsets.all(12.0), 
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(26), 
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ), 
                            width: 200, 
                            height: 200, 
                            child: TextButton(
                              onPressed: (){
                                Navigator.pushNamed(context, '/exercicios');
                              }, 
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                                crossAxisAlignment: CrossAxisAlignment.center, 
                                children:[
                                  Icon(
                                    Icons.cleaning_services, 
                                    color: Color.fromARGB(255, 0, 0, 0), 
                                    size: 150
                                  ),
                                Text(
                                  'Diarista', 
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 121, 134, 152), 
                                    fontSize : 26,
                                  ), 
                                  textAlign: TextAlign.center
                                )
                                ],
                              )
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0), 
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(26), 
                              color: const Color.fromARGB(255, 255, 255, 255),
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
                                  Icon(
                                    Icons.flash_on, 
                                    color: Color.fromARGB(255, 0, 0, 0), 
                                    size: 150
                                  ),
                                  Text(
                                    'Eletricista', 
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 121, 134, 152), 
                                      fontSize: 26
                                    ), 
                                    textAlign: TextAlign.center
                                  )
                                ],
                              )
                            ),
                          ),
                        )
                ]
                ),
            ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label:'Notificat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label:'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label:'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label:'Projects',
          )
        ],
      )
    );
  }
}