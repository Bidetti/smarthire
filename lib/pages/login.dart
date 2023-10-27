import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:smarthire/service/auth_service.dart';
import 'package:smarthire/service/users_service.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      try {
        loginUser(data.name, data.password);
      } catch (e) {
        return e.toString();
      }
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String email) {
    debugPrint('Name: $email');
    return Future.delayed(loginTime).then((_) {
      try {
        final user = getUserByEmail(email);
        if (user == null) {
          return 'No user with this email';
        }
        return 'We sent the link to your email to recover your password';
            } catch (e) {
        return e.toString();
      }
      return 'null';
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'SmartHire',
      logo: const AssetImage('assets/smarthire.png'),
      onLogin: _authUser,
      onSignup: _signupUser,
      // onSubmitAnimationCompleted: () {
      //   Navigator.of(context).pushReplacement(MaterialPageRoute(
      //     builder: (context) => DashboardScreen(),
      //   ));
      // },
      onRecoverPassword: _recoverPassword,
    );
  }
}