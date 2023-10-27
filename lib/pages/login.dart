import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:smarthire/pages/homepage.dart';
import 'package:smarthire/service/auth_service.dart';
import 'package:smarthire/service/users_service.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) {
    return Future.delayed(loginTime).then((_) {
      try {
        return loginUser(data.name, data.password);
      } catch (e) {
        return e.toString();
      }
    });
  }

  Future<String?> _signupUser(SignupData data) {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String email) {
    return Future.delayed(loginTime).then((_) {
      try {
        //final user = getUserByEmail(email);
        return 'We sent the link to your email to recover your password';
            } catch (e) {
        return e.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'SmartHire',
      logo: const AssetImage('assets/smarthire.png'),
      onLogin: _authUser,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
           builder: (context) => const HomePage(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}