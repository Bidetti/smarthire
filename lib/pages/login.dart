// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:validators/validators.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   TextEditingController _TextEditingController = TextEditingController();

//   @override
//   void dispose() {
//     _TextEditingController.clear();
//     super.dispose();
//   }

//   bool isEmailCorrect = false;
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   'assets/smarthire_branco.png',
//                   height: 200,
//                   width: 600,
//                 ),
//                 Text(
//                   'Inicie sessão para continuar a utilizar o nosso APP.',
//                   style: GoogleFonts.poppins(
//                     textStyle: TextStyle(
//                         color: Colors.black.withOpacity(0.7),
//                         fontWeight: FontWeight.w300,
//                         // height: 1.5,
//                         fontSize: 15),
//                   ),
//                 ),

//                 const SizedBox(
//                   height: 30,
//                 ),
//                 Container(
//                   height: isEmailCorrect ? 280 : 200,
//                   // _formKey!.currentState!.validate() ? 200 : 600,
//                   // height: isEmailCorrect ? 260 : 182,
//                   width: MediaQuery.of(context).size.width / 1.1,
//                   decoration: BoxDecoration(
//                       color: Colors.white.withOpacity(0.3),
//                       borderRadius: BorderRadius.circular(20)),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(
//                             left: 20, right: 20, bottom: 20, top: 20),
//                         child: TextFormField(
//                           controller: _TextEditingController,
//                           onChanged: (val) {
//                             setState(() {
//                               isEmailCorrect = isEmail(val);
//                             });
//                           },
//                           decoration: const InputDecoration(
//                             focusedBorder: UnderlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.blue),
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(10))),
//                             enabledBorder: UnderlineInputBorder(
//                                 borderSide: BorderSide.none,
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(10))),
//                             prefixIcon: Icon(
//                               Icons.person,
//                               color: Colors.blue,
//                             ),
//                             filled: true,
//                             fillColor: Colors.white,
//                             labelText: "Login",
//                             hintText: 'Seu nome de usuário ou email...',
//                             labelStyle: TextStyle(color: Colors.black),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 20, right: 20),
//                         child: Form(
//                           key: _formKey,
//                           child: TextFormField(
//                             obscuringCharacter: '*',
//                             obscureText: true,
//                             decoration: const InputDecoration(
//                               focusedBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: Colors.blue),
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(10))),
//                               enabledBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide.none,
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(10))),
//                               prefixIcon: Icon(
//                                 Icons.person,
//                                 color: Colors.blue,
//                               ),
//                               filled: true,
//                               fillColor: Colors.white,
//                               labelText: "Senha",
//                               hintText: 'Sua senha...',
//                               labelStyle: TextStyle(color: Colors.black),
//                             ),
//                             validator: (value) {
//                               if (value!.isEmpty && value!.length < 5) {
//                                 return 'Senha inválida!';
//                               }
//                             },
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       isEmailCorrect
//                           ? ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius:
//                                           BorderRadius.circular(10.0)),
//                                   backgroundColor: isEmailCorrect == false
//                                       ? Colors.red
//                                       : const Color(0xFF003778),
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 131, vertical: 20)
//                                   // padding: EdgeInsets.only(
//                                   //     left: 120, right: 120, top: 20, bottom: 20),
//                                   ),
//                               onPressed: () {
//                                 if (_formKey.currentState!.validate()) {
//                                   // If the form is valid, display a snackbar. In the real world,
//                                   // you'd often call a server or save the information in a database.
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     const SnackBar(
//                                         content: Text('Processing Data')),
//                                   );
//                                 }
//                                 // Navigator.push(
//                                 //     context,
//                                 //     MaterialPageRoute(
//                                 //         builder: (context) => LoginScreen()));
//                               },
//                               child: const Text(
//                                 'ENTRAR',
//                                 style: TextStyle(
//                                     fontSize: 20, fontWeight: FontWeight.bold),
//                               ))
//                           : Container(),
//                     ],
//                   ),
//                 ),

//                 //this is button
//                 // const SizedBox(
//                 //   height: 30,
//                 // ),
//                 // ElevatedButton(
//                 //     style: ElevatedButton.styleFrom(
//                 //         shape: RoundedRectangleBorder(
//                 //             borderRadius: BorderRadius.circular(10.0)),
//                 //         backgroundColor: Colors.purple,
//                 //         padding: EdgeInsets.symmetric(
//                 //             horizontal: MediaQuery.of(context).size.width / 3.3,
//                 //             vertical: 20)
//                 //         // padding: EdgeInsets.only(
//                 //         //     left: 120, right: 120, top: 20, bottom: 20),
//                 //         ),
//                 //     onPressed: () {
//                 //       Navigator.push(
//                 //           context,
//                 //           MaterialPageRoute(
//                 //               builder: (context) => LoginScreen()));
//                 //     },
//                 //     child: Text(
//                 //       'Sounds Good!',
//                 //       style: TextStyle(fontSize: 17),
//                 //     )), //
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Você ainda não possui uma conta?',
//                       style: TextStyle(
//                         color: Colors.black.withOpacity(0.6),
//                       ),
//                     ),
//                     TextButton(
//                       onPressed: () {},
//                       child: const Text(
//                         'Cadastrar-se!',
//                         style: TextStyle(
//                             color: Colors.blue, fontWeight: FontWeight.w500),
//                       ),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
