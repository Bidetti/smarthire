import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  bool _nameError = false;
  bool _emailError = false;
  bool _cpfError = false;
  bool _passwordError = false;
  bool _birthdayError = false;
  bool _phoneError = false;
  int _selectedUserType = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: [
            Image.asset(
              'assets/smarthire_branco.png',
              height: 125,
              width: 400,
            ),
            const SizedBox(height: 24.0),
            _criarTextFormField(
              label: 'Nome Completo',
              placeholder: 'Ex: João da Silva',
              icone: Icons.person,
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value!.isEmpty) {
                  _nameError = true;
                  return 'Nome não pode ser vazio';
                }
                _nameError = false;
                return null;
              },
            ),
            const SizedBox(height: 24.0),
            _criarTextFormField(
                label: 'E-mail',
                placeholder: 'Ex: joao.silva@gmail.com',
                icone: Icons.email,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (!isEmail(value!)) {
                    _emailError = true;
                    return 'E-mail inválido';
                  } else if (value.isEmpty) {
                    _emailError = true;
                    return 'E-mail não pode ser vazio';
                  }
                  _emailError = false;
                  return null;
                }),
            const SizedBox(height: 24.0),
            _criarTextFormField(
              label: 'Senha',
              placeholder: 'Digite sua senha',
              icone: Icons.lock,
              isSenha: true,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty) {
                  _passwordError = true;
                  return 'Senha não pode ser vazia';
                }
                _passwordError = false;
                return null;
              },
            ),
            const SizedBox(height: 24.0),
            _criarTextFormField(
              label: 'CPF',
              placeholder: 'Ex: 12345678900',
              icone: Icons.badge,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  _cpfError = true;
                  return 'CPF não pode ser vazio';
                } else if (value.length != 11) {
                  _cpfError = true;
                  return 'CPF deve conter 11 dígitos';
                } else if (int.tryParse(value) == null) {
                  _cpfError = true;
                  return 'CPF deve conter somente números';
                }
                _cpfError = false;
                return null;
              },
            ),
            const SizedBox(height: 24.0),
            _criarTextFormField(
              label: 'Data de Nascimento',
              placeholder: 'Ex: 11/01/2008',
              icone: Icons.calendar_today,
              keyboardType: TextInputType.datetime,
              validator: (value) {
                if (value!.isEmpty) {
                  _birthdayError = true;
                  return 'Data de nascimento não pode ser vazia';
                }
                _birthdayError = false;
                return null;
              },
            ),
            const SizedBox(height: 24.0),
            _criarTextFormField(
                label: 'Telefone (com DDD)',
                placeholder: 'Ex: 11999999999',
                icone: Icons.phone,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value!.isEmpty) {
                    _phoneError = true;
                    return 'Telefone não pode ser vazio';
                  }
                  _phoneError = false;
                  return null;
                }),
            const SizedBox(height: 24.0),
            Column(
              children: <Widget>[
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Cadastrar como:',
                    style: TextStyle(fontSize: 16), // Increase the font size
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: RadioListTile<int>(
                        title: const Text('Prestador'),
                        value: 0,
                        groupValue: _selectedUserType,
                        onChanged: (int? value) {
                          setState(() {
                            _selectedUserType = value!;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<int>(
                        title: const Text('Contratante'),
                        value: 1,
                        groupValue: _selectedUserType,
                        onChanged: (int? value) {
                          setState(() {
                            _selectedUserType = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: _nameError ||
                      _emailError ||
                      _cpfError ||
                      _passwordError ||
                      _birthdayError ||
                      _phoneError
                  ? null
                  : () {
                      Navigator.of(context).pushNamed('/home');
                    },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  backgroundColor: !_nameError &&
                          !_emailError &&
                          !_cpfError &&
                          !_passwordError &&
                          !_birthdayError &&
                          !_phoneError
                      ? const Color(0xFF003778)
                      : const Color(0xFF003778).withOpacity(0.7),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 100, vertical: 27)),
              child: const Text(
                'CONTINUAR',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
            ),
            const SizedBox(height: 24.0),
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
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Já possui uma conta?'),
                const SizedBox(width: 8.0),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue,
                  ),
                  child: const Text('ENTRAR'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _criarTextFormField({
    required String label,
    required String placeholder,
    required IconData icone,
    required TextInputType keyboardType,
    bool isSenha = false,
    // possibilidade de criar um validator
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      obscureText: isSenha,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 4, 34, 168)),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        prefixIcon: Icon(
          icone,
          color: const Color.fromARGB(255, 4, 34, 168),
        ),
        filled: true,
        fillColor: Colors.grey[200],
        labelText: label,
        hintText: placeholder,
        labelStyle: const TextStyle(color: Colors.black, fontSize: 16.0),
      ),
      validator: validator,
    );
  }
}
