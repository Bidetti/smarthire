import 'package:flutter/material.dart';



class Projects extends StatelessWidget {
  const Projects({ Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            children: [
              Image.asset('assets/smarthire_branco.png'),               
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