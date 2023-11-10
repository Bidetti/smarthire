import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarthire/pages/auth/register.dart';
import 'package:smarthire/pages/homepage.dart';
import 'package:smarthire/service/auth_service.dart';
import 'package:validators/validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.clear();
    _passwordController.clear();
    super.dispose();
  }

  bool isEmailCorrect = false;
  final _formKey = GlobalKey<FormState>();

  void showSnackBar(String message, Color color) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: color,
        ),
      );
    }
  }

  void navigateToPage(Widget page) {
  if (mounted) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }
}

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
                                Icons.lock,
                                color: Colors.blue,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Senha",
                              hintText: 'Sua senha...',
                              labelStyle: TextStyle(color: Colors.black),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Senha não pode ser vazia';
                              }
                              return null;
                            },
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
                                    if (response == 200) {
                                      showSnackBar('Sucesso: Login efetuado!', Colors.green[700]!);
                                      navigateToPage(const HomePage());
                                    } else if (response == 401) {
                                      showSnackBar('Erro: Email ou senha incorretos!', Colors.red);
                                    } else {
                                      showSnackBar('Erro: Occoreu um erro ao fazer login.', Colors.red);
                                    }
                                  } catch (e) {
                                    showSnackBar('Erro: Occoreu um erro ao fazer login.', Colors.red);
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Você ainda não possui uma conta?',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        navigateToPage(RegisterScreen());
                      },
                      child: const Text(
                        'Cadastrar-se!',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
