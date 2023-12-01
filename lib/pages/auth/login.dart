import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  bool isPasswordCorrect = false;
  bool _agreedToTOS = false;
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

  void navigatePushNamed(String route) {
    if (mounted) {
      Navigator.pushNamed(context, route);
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 100),
                  child: Image.asset(
                    'assets/smarthire_branco.png',
                    height: 200,
                    width: 600,
                  ),
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
                  height: 310,
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
                          decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 4, 34, 168)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Color.fromARGB(255, 4, 34, 168),
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                            labelText: "Email",
                            hintText: 'Seu email...',
                            labelStyle: const TextStyle(color: Colors.black),
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
                            onChanged: (val) {
                              setState(() {
                                isPasswordCorrect = val.length >= 6;
                              });
                            },
                            obscuringCharacter: '*',
                            obscureText: true,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 4, 34, 168)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Color.fromARGB(255, 4, 34, 168),
                              ),
                              filled: true,
                              fillColor: Colors.grey[200],
                              labelText: "Senha",
                              hintText: 'Sua senha...',
                              labelStyle: const TextStyle(color: Colors.black),
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
                      CheckboxListTile(
                        title: const Text(
                          'Eu concordo com os Termos de Uso',
                          style: TextStyle(fontSize: 14),
                        ),
                        value: _agreedToTOS,
                        onChanged: (bool? newValue) {
                          setState(() {
                            _agreedToTOS = newValue!;
                          });

                          if (_agreedToTOS) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Termos de Uso'),
                                  content: const SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        Text('Termos de uso vão aqui...'),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('Concordo'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            backgroundColor: isEmailCorrect
                                ? const Color(0xFF003778)
                                : const Color(0xFF003778).withOpacity(0.7),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 131, vertical: 20)),
                        onPressed: isEmailCorrect &&
                                isPasswordCorrect &&
                                _agreedToTOS
                            ? () async {
                                if (_formKey.currentState!.validate()) {
                                  try {
                                    final email = _emailController.text;
                                    final password = _passwordController.text;
                                    final response =
                                        await loginUser(email, password);
                                    if (response == 200) {
                                      showSnackBar('Sucesso: Login efetuado!',
                                          Colors.green[700]!);
                                      navigatePushNamed('/home');
                                    } else if (response == 401) {
                                      showSnackBar(
                                          'Erro: Email ou senha incorretos!',
                                          Colors.red);
                                    } else {
                                      showSnackBar(
                                          'Erro: Ocorreu um erro ao fazer login.',
                                          Colors.red);
                                    }
                                  } catch (e) {
                                    showSnackBar(
                                        'Erro: Ocorreu um erro ao fazer login.',
                                        Colors.red);
                                  }
                                }
                              }
                            : null,
                        child: const Text(
                          'ENTRAR',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              navigatePushNamed('/recover');
                            },
                            child: const Text(
                              'Esqueceu a senha?',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50.0,
                      height: 1.0,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      'OU',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                    const SizedBox(width: 8.0),
                    Container(
                      width: 50.0,
                      height: 1.0,
                      color: Colors.black,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
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
                        navigatePushNamed('/cadastro');
                      },
                      child: const Text(
                        'Cadastrar-se!',
                        style: TextStyle(
                            color: Color.fromARGB(255, 4, 34, 168),
                            fontWeight: FontWeight.w500),
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
