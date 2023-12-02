import 'package:flutter/material.dart';

class Projects extends StatefulWidget {
  const Projects({ Key? key}): super(key: key);
  
  @override
  _ProjectsState createState() => _ProjectsState();
  
}

class _ProjectsState extends State<Projects> {
  bool isVisible = false;
  bool isVisible2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: Padding(
        padding: const EdgeInsets.all(8.0), 
        child: Column(
          children: [
            Center(child: Image.asset('assets/smarthire_branco.png', width: 250, height: 250),),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children:[
                  const Text(
                  'Projetos Ativos',
                  style: TextStyle(
                    fontSize: 30, 
                    fontWeight: FontWeight.bold, 
                    color: Color.fromARGB(255, 121, 134, 152), 
                    decoration: TextDecoration.none,
                    ),
                  ),
                  TextButton(
                    
                    onPressed: (){
                      setState((){
                        isVisible = !isVisible;
                      });
                    },
                    child: const Icon(
                      (Icons.arrow_forward_ios), 
                      color: Color.fromARGB(255, 121, 134, 152),
                    ),
                    
                  ),

                  Visibility(
                    visible: isVisible,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2), 
                        color:const Color.fromARGB(255, 9, 114, 234),
                      ),
                    ),
                  ),
                ]
              ),
            ),
              
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children:[
                  const Text(
                  'Projetos Finalizados',
                  style: TextStyle(
                    fontSize: 30, 
                    fontWeight: FontWeight.bold, 
                    color: Color.fromARGB(255, 121, 134, 152), 
                    decoration: TextDecoration.none,
                    ),
                  ),
                  TextButton(
                    
                    onPressed: (){
                      setState((){
                        isVisible2 = !isVisible2;
                      });
                    },
                    child: const Icon(
                      (Icons.arrow_forward_ios), 
                      color: Color.fromARGB(255, 121, 134, 152),
                    ),
                    
                  ),

                  Visibility(
                    visible: isVisible2,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2), 
                        color:Color.fromARGB(255, 163, 9, 234),
                      ),
                    ),
                  ),
                ]
              ),
            ),
            
            Wrap(children: [
              Padding(
                padding: const EdgeInsets.all(20.0), 
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26), 
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ), 
                  width: 200, 
                ),
              ),
            ]),
          ],
        ),
      ),
      
      //Navbar Inferior
      bottomNavigationBar: BottomNavigationBar( 
        backgroundColor: const Color.fromARGB(255,0, 55, 120),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromRGBO(255, 255, 255, 0.6),
        unselectedItemColor: const Color.fromRGBO(255, 255, 255, 0.6),
        items:const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon:  SizedBox(
              width: 30.0,
              height: 30.0,
              child: Icon(Icons.notifications),
            ),
            label: 'Notificações',
            backgroundColor:Color.fromRGBO(0, 55, 120, 1)
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 30.0,
              height: 30.0,
              child: Icon(Icons.home),
            ),
            label: 'Início',
            backgroundColor:Color.fromRGBO(0, 55, 120, 1)
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 30.0,
              height: 30.0,
              child: Icon(Icons.person),
            ),
            label: 'Perfil',
            backgroundColor:Color.fromRGBO(0, 55, 120, 1)
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 30.0,
              height: 30.0,
              child: Icon(Icons.assignment)
            ),
            label: 'Projects',
            backgroundColor:Color.fromRGBO(0, 55, 120, 1)
            
          ),
        ],
        
      ),
    );
  }
}