import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({Key? key}) : super(key: key);

  @override
  CadastroScreenState createState() => CadastroScreenState();
}

class CadastroScreenState extends State<CadastroScreen> {
  bool _nameError = true;
  bool _emailError = true;
  bool _cpfError = true;
  bool _passwordError = true;
  bool _birthdayError = true;
  bool _phoneError = true;
  int _selectedUserType = 1;

  bool _isValidForm() {
    return !_nameError &&
        !_emailError &&
        !_cpfError &&
        !_passwordError &&
        !_birthdayError &&
        !_phoneError;
  }

  Widget _buildPrestadorWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _criarTextFormField(
          label: 'CEP',
          placeholder: 'Ex: 12345-678',
          icone: Icons.location_on,
          keyboardType: TextInputType.number,
          validator: (value) {
            return null;
          },
        ),
        const SizedBox(height: 16.0),
        _criarTextFormField(
          label: 'Endereço',
          placeholder: 'Ex: Rua ABC',
          icone: Icons.location_on,
          keyboardType: TextInputType.text,
          validator: (value) {
            // Adicione a lógica de validação, se necessário
            return null;
          },
        ),
        const SizedBox(height: 16.0),
        Row(
          children: [
            Expanded(
              child: _criarTextFormField(
                label: 'Número',
                placeholder: 'Ex: 123',
                icone: Icons.location_on,
                keyboardType: TextInputType.number,
                validator: (value) {
                  // Adicione a lógica de validação, se necessário
                  return null;
                },
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: _criarTextFormField(
                label: 'Complemento',
                placeholder: 'Ex: Apto 4',
                icone: Icons.location_on,
                keyboardType: TextInputType.text,
                validator: (value) {
                  // Adicione a lógica de validação, se necessário
                  return null;
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        _criarTextFormField(
          label: 'RG',
          placeholder: 'Ex: 123456789',
          icone: Icons.badge,
          keyboardType: TextInputType.number,
          validator: (value) {
            // Adicione a lógica de validação, se necessário
            return null;
          },
        ),
        const SizedBox(height: 16.0),
        // Adicione um widget para escolher uma foto de perfil, se necessário
      ],
    );
  }

  Widget _buildContratanteWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _criarTextFormField(
          label: 'CEP',
          placeholder: 'Ex: 12345-678',
          icone: Icons.location_on,
          keyboardType: TextInputType.number,
          validator: (value) {
            // Adicione a lógica de validação, se necessário
            return null;
          },
        ),
        const SizedBox(height: 16.0),
        _criarTextFormField(
          label: 'Endereço',
          placeholder: 'Ex: Rua ABC',
          icone: Icons.location_on,
          keyboardType: TextInputType.text,
          validator: (value) {
            // Adicione a lógica de validação, se necessário
            return null;
          },
        ),
        const SizedBox(height: 16.0),
        Row(
          children: [
            Expanded(
              child: _criarTextFormField(
                label: 'Número',
                placeholder: 'Ex: 123',
                icone: Icons.location_on,
                keyboardType: TextInputType.number,
                validator: (value) {
                  // Adicione a lógica de validação, se necessário
                  return null;
                },
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: _criarTextFormField(
                label: 'Complemento',
                placeholder: 'Ex: Apto 4',
                icone: Icons.location_on,
                keyboardType: TextInputType.text,
                validator: (value) {
                  // Adicione a lógica de validação, se necessário
                  return null;
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        // Adicione um widget para escolher uma foto de perfil, se necessário
      ],
    );
  }

  Widget _criarTextFormField({
    required String label,
    required String placeholder,
    required IconData icone,
    required TextInputType keyboardType,
    bool isSenha = false,
    String? Function(String?)? validator,
    void Function(String)? onChanged, // Adicione essa linha
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
      onChanged: onChanged,
      validator: validator,
    );
  }

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
                if (_nameError) {
                  return 'Seu nome não pode ser vazio!';
                }
                return null;
              },
              onChanged: (value) {
                if (value.length < 2) {
                  _nameError = true;
                } else {
                  _nameError = false;
                }
              },
            ),
            const SizedBox(height: 24.0),
            _criarTextFormField(
              label: 'E-mail',
              placeholder: 'Ex: joao.silva@gmail.com',
              icone: Icons.email,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                if (!isEmail(value)) {
                  _emailError = true;
                } else {
                  _emailError = false;
                }
              },
              validator: (value) {
                if (_emailError) {
                  return 'E-mail inválido';
                }
                return null;
              },
            ),
            const SizedBox(height: 24.0),
            _criarTextFormField(
              label: 'Senha',
              placeholder: 'Digite sua senha',
              icone: Icons.lock,
              isSenha: true,
              keyboardType: TextInputType.text,
              onChanged: (value) {
                if (value.length < 6) {
                  _passwordError = true;
                } else {
                  _passwordError = false;
                }
              },
              validator: (value) {
                if (_passwordError) {
                  return 'Senha deve ter no mínimo 6 caracteres';
                }
                return null;
              },
            ),
            const SizedBox(height: 24.0),
            _criarTextFormField(
              label: 'CPF',
              placeholder: 'Ex: 12345678900',
              icone: Icons.badge,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (!isNumeric(value)) {
                  _cpfError = true;
                } else {
                  _cpfError = false;
                }
              },
              validator: (value) {
                if (_cpfError) {
                  return 'CPF inválido';
                }
                return null;
              },
            ),
            const SizedBox(height: 24.0),
            _criarTextFormField(
              label: 'Idade',
              placeholder: 'Ex: 20',
              icone: Icons.calendar_today,
              keyboardType: TextInputType.datetime,
              onChanged: (value) {
                if (!isNumeric(value)) {
                  _birthdayError = true;
                } else {
                  _birthdayError = false;
                }
              },
              validator: (value) {
                if (_birthdayError) {
                  return 'Data de nascimento inválida';
                }
                return null;
              },
            ),
            const SizedBox(height: 24.0),
            _criarTextFormField(
                label: 'Telefone (com DDD)',
                placeholder: 'Ex: 11999999999',
                icone: Icons.phone,
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  if (!isNumeric(value)) {
                    _phoneError = true;
                  } else {
                    _phoneError = false;
                  }
                },
                validator: (value) {
                  if (_phoneError) {
                    return 'Telefone inválido';
                  }
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
                        title: const Text(
                          'Contratante',
                          style: TextStyle(fontSize: 14),
                        ),
                        value: 1,
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
                        title: const Text(
                          'Prestador',
                          style: TextStyle(fontSize: 14),
                        ),
                        value: 0,
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
            _selectedUserType == 0
                ? _buildPrestadorWidget()
                : _buildContratanteWidget(),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: _isValidForm()
                  ? () {
                      Navigator.of(context).pushNamed('/');
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                backgroundColor: _isValidForm()
                    ? const Color(0xFF003778)
                    : const Color(0xFF003778).withOpacity(0.7),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
              ),
              child: const Text(
                'CONTINUAR',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
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
}
