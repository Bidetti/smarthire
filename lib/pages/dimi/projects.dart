import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Projects extends StatefulWidget {
  const Projects({ Key? key}): super(key: key);
  
  @override
  _ProjectsState createState() => _ProjectsState();
  
}

class _ProjectsState extends State<Projects> {
  bool isVisible = false;
  bool isVisible2 = false;
  final TextEditingController dateController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    void submit(){
      Navigator.of(context).pop();
    }
    Future openDialog() => showDialog( //Pop-up "confs"
      context: context,
      builder: (context) => Theme(
        data: Theme.of(context).copyWith(
          inputDecorationTheme: InputDecorationTheme(
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color.fromRGBO(187, 216, 255, 1), width: 3.0),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ), 
        child: AlertDialog(
        content: SingleChildScrollView(
          child: Column(
          children: [
            const TextField(
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Reboque na parede',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(187, 216, 255, 1),
                  ),
                )
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: dateController,
              readOnly: true, // Prevent keyboard from appearing
              decoration: const InputDecoration(
                hintText: '28/10/2024',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(187, 216, 255, 1),
                  ),
                ),
              ),
              onTap: () async {
                DateTime? date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (date != null) {
                  String formattedDate = DateFormat('yyyy-MM-dd').format(date);
                  dateController.text = formattedDate;
                }
              },
            ),
            const TextField(
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'R\$1.650,00',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(187, 216, 255, 1),
                  ),
                )
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color:const Color.fromRGBO(187, 216, 255, 1),
                  width: 3.5,
                ),
                borderRadius: BorderRadius.circular(50), 
                color:const Color.fromARGB(255, 255, 255, 255),
              
              ),
              child: const Row(
                children: [
                  Icon(Icons.person, color: Color.fromRGBO(121, 134, 152, 1), size: 40,),
                  Column(
                    children:[
                      Text('Brian Jhonson', style: TextStyle(color: Color.fromRGBO(121, 134, 152, 1)),),
                      Row(
                        children: [
                          Text('Pedreiro ', style: TextStyle(color: Color.fromRGBO(121, 134, 152, 1), fontSize: 13),),
                          Icon(Icons.star, color: Color.fromRGBO(121, 134, 152, 1)),
                          Text('4.5', style: TextStyle(color: Color.fromRGBO(121, 134, 152, 1), fontSize: 13)),
                          Icon(Icons.pin_drop, color: Color.fromRGBO(121, 134, 152, 1)),
                          Text('12.0km', style: TextStyle(color: Color.fromRGBO(121, 134, 152, 1), fontSize: 13)),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            const Text(' Avaliar Prestador:'),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Color.fromARGB(255, 0, 55, 120),
              ),
              onRatingUpdate: (rating) {},
            ),

          ],
        ),
        ), 
        actions: [Row(
          children: [
            ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              elevation: MaterialStateProperty.all(0),
            ),
            onPressed: submit, 
            child:const Row(
              children: [
                Icon(
                  Icons.save, 
                  color: Color.fromRGBO(0, 55, 120, 1),
                ), 
                Text(
                  'Salvar',style: TextStyle(
                    color: Color.fromRGBO(0, 55, 120, 1)
                  ) ,
                ),
              ],
            ) 
            
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              elevation: MaterialStateProperty.all(0),
            ),
            onPressed: submit, 
            child:const Row(
              children: [
                Icon(
                  Icons.do_disturb, 
                  color: Color.fromRGBO(176, 0, 0, 1),
                ), 
                Text(
                  'Cancelar',style: TextStyle(
                    color: Color.fromRGBO(176, 0, 0, 1)
                  ) ,
                ),
              ],
            ) 
            
          )
          ],
        )
          
        ],
      ),
      )
    );

    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: Padding(
        padding: const EdgeInsets.all(8.0), 
        child: Column(
          children: [
            Center(child: Image.asset('assets/smarthire_branco.png', width: 250, height: 250),),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Row(
                    children:[
                      const Text(
                        'Projetos Ativos',
                        style: TextStyle(
                          fontSize: 30, 
                          fontWeight: FontWeight.w400, 
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
                        child: Icon(
                          (isVisible? Icons.arrow_drop_down_outlined:Icons.arrow_right), 
                          color:const Color.fromARGB(255, 121, 134, 152),
                        ),
                      ),

                      
                    ]
                  ),
                  Visibility(
                    visible: isVisible,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(1),
                          width: 363,
                          height: 208,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color:const Color.fromRGBO(187, 216, 255, 1),
                              width: 3.5,
                            ),
                            borderRadius: BorderRadius.circular(20), 
                            color:const Color.fromARGB(255, 255, 255, 255),
                          ),
                          child: Column(
                            children: [
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '\nReboque na parede',
                                  style: TextStyle(
                                    fontSize: 20, 
                                    fontWeight: FontWeight.w600, 
                                    color: Color.fromARGB(255, 121, 134, 152), 
                                    decoration: TextDecoration.none,
                                  ),
                                  textAlign: TextAlign.left,
                                )

                              ),
                              const Row(
                                children: [
                                  Icon(
                                    Icons.access_time, 
                                    color: Color.fromARGB(255, 121, 134, 152), 
                                    size:19,
                                  ),
                                  Text(
                                    '28/10/2024',
                                    style: TextStyle(
                                      fontSize: 19, 
                                      fontWeight: FontWeight.w300, 
                                      color: Color.fromARGB(255, 121, 134, 152), 
                                      decoration: TextDecoration.none,
                                    ),
                                  )
                                ],
                              ),
                              const Align(
                                alignment: Alignment.centerLeft,  
                                child: Text(
                                  'Preço Proposto: R\$ 1.650,00',
                                  style: TextStyle(
                                    fontSize: 19, 
                                    fontWeight: FontWeight.w300, 
                                    color: Color.fromARGB(255, 121, 134, 152), 
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                style:ButtonStyle(
                                  elevation: MaterialStateProperty.all(0),
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                    const Color.fromARGB(255, 255, 255, 255)
                                  )
                                ),
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.create,
                                      color: Color.fromARGB(255, 121, 134, 152),
                                    ),
                                    Text(
                                      'Editar informações do Projeto',
                                      style: TextStyle(
                                        fontSize: 18, 
                                        fontWeight: FontWeight.w600, 
                                        color: Color.fromARGB(255, 121, 134, 152), 
                                        decoration: TextDecoration.none,
                                      
                                      ),
                                    )
                                  ],
                                ),
                                onPressed: (){
                                  openDialog();
                                },

                              ),
                              TextButton(
                                onPressed: (){
                                  Navigator.pushNamed(context, '/project');//finalizar projeto
                                },
                                child: const Text(
                                  'Finalizar Projeto',
                                  style: TextStyle(
                                    fontSize: 30, 
                                    fontWeight: FontWeight.bold, 
                                    color: Color.fromARGB(255, 176, 0, 0), 
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              )

                            ],
                            
                          ),
                        ),
                      ],
                    )
                  ),
                  
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Row(
                    children:[
                      const Text(
                        'Projetos Finalizados',
                        style: TextStyle(
                          fontSize: 30, 
                          fontWeight: FontWeight.w400, 
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
                        child: Icon(
                          (isVisible2? Icons.arrow_drop_down_outlined:Icons.arrow_right), 
                          color:const Color.fromARGB(255, 121, 134, 152),
                        ),
                      ),

                      
                    ]
                  ),
                  Visibility(
                    visible: isVisible2,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(1),
                          width: 363,
                          height: 208,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color:const Color.fromRGBO(121, 134, 152, 1),
                              width: 3.5,
                            ),
                            borderRadius: BorderRadius.circular(20), 
                            color:const Color.fromARGB(255, 255, 255, 255),
                          ),
                          child: Column(
                            children: [
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '\nTroca de disjuntor',
                                  style: TextStyle(
                                    fontSize: 20, 
                                    fontWeight: FontWeight.w600, 
                                    color: Color.fromARGB(255, 121, 134, 152), 
                                    decoration: TextDecoration.none,
                                  ),
                                  textAlign: TextAlign.left,
                                )

                              ),
                              const Row(
                                children: [
                                  Icon(
                                    Icons.access_time, 
                                    color: Color.fromARGB(255, 121, 134, 152), 
                                    size:19,
                                  ),
                                  Text(
                                    '01/09/2023',
                                    style: TextStyle(
                                      fontSize: 19, 
                                      fontWeight: FontWeight.w300, 
                                      color: Color.fromARGB(255, 121, 134, 152), 
                                      decoration: TextDecoration.none,
                                    ),
                                  )
                                ],
                              ),
                              const Align(
                                alignment: Alignment.centerLeft,  
                                child: Text(
                                  'Preço Final: R\$ 450,00',
                                  style: TextStyle(
                                    fontSize: 19, 
                                    fontWeight: FontWeight.w300, 
                                    color: Color.fromARGB(255, 121, 134, 152), 
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.create), 
                                    color:const Color.fromARGB(255, 121, 134, 152),
                                    onPressed: (){
                                      Navigator.pushNamed(context, '/editproject');
                                    }
                                  ),
                                  TextButton(
                                    child: const Text(
                                      'Editar informações do Projeto',
                                      style: TextStyle(
                                        fontSize: 18, 
                                        fontWeight: FontWeight.w600, 
                                        color: Color.fromARGB(255, 121, 134, 152), 
                                        decoration: TextDecoration.lineThrough,
                                      ) 
                                    ),
                                    onPressed: (){
                                      Navigator.pushNamed(context, '/editproject');
                                    
                                    },
                                  )
                                ],
                              ),
                              TextButton(
                                onPressed: (){
                                  Navigator.pushNamed(context, '/project');//finalizar projeto
                                },
                                child: const Text(
                                  'Projeto Finalizado',
                                  style: TextStyle(
                                    fontSize: 30, 
                                    fontWeight: FontWeight.bold, 
                                    color: Color.fromARGB(255, 121, 134, 152), 
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              )

                            ],
                            
                          ),
                        ),
                      ],
                    )
                  ),
                  
                ],
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