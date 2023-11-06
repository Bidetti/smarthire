import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarthire/pages/homepage.dart';
import 'package:smarthire/service/auth_service.dart';
import 'package:validators/validators.dart';
final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.clear();
    _passwordController.clear();
    super.dispose();
  }

  bool isEmailCorrect = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/smarthire_branco.png',
                  height: 200,
                  width: 600,
                ),
                Text(
                  'Inicie sessão para continuar a utilizar o nosso APP.',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w300,
                        // height: 1.5,
                        fontSize: 15),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: isEmailCorrect ? 280 : 200,
                  width: MediaQuery.of(context).size.width / 1.1,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 20, top: 20),
                        child: TextFormField(
                          controller: _emailController,
                          onChanged: (val) {
                            setState(() {
                              isEmailCorrect = isEmail(val);
                            });
                          },
                          decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.blue,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            labelText: "Login",
                            hintText: 'Seu nome de usuário ou email...',
                            labelStyle: TextStyle(color: Colors.black),
                          ),
                          validator: (value) {
                            if (isEmailCorrect == false) {
                              return 'Email inválido';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Form(
                          key: _formKey,
                          child: TextFormField(
                            controller: _passwordController,
                            obscuringCharacter: '*',
                            obscureText: true,
                            decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.blue,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Senha",
                              hintText: 'Sua senha...',
                              labelStyle: TextStyle(color: Colors.black),
                            ),
                            validator: (value) => value!.isEmpty
                                ? 'Senha não pode ser vazia'
                                : null,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      isEmailCorrect
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  backgroundColor: isEmailCorrect == false
                                      ? Colors.red
                                      : const Color(0xFF003778),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 131, vertical: 20)),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  try {
                                    final email = _emailController.text;
                                    final password = _passwordController.text;
                                    final response =
                                        await loginUser(email, password);

                                    if (response == true) {
                                      scaffoldMessengerKey.currentState!
                                          .showSnackBar(const SnackBar(
                                              content:
                                                  Text('Login bem-sucedido!')));
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomePage()));
                                    } else {
                                      scaffoldMessengerKey.currentState!
                                          .showSnackBar(SnackBar(
                                              content: Text('Email ou senha incorretos!')));
                                    }
                                  } catch (e) {
                                    scaffoldMessengerKey.currentState!
                                        .showSnackBar(const SnackBar(
                                            content: Text('Login falhou!')));
                                  }
                                }
                              },
                              child: const Text(
                                'ENTRAR',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ))
                          : Container(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
