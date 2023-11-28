import 'package:flutter/material.dart';
import '../screen/login_screen.dart';
import '../screen/register_screen.dart';
import '../screen/home_screen.dart';
import '../screen/changePassword_screen.dart';

class AppNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam Grading Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(onLogin: () {
          // Navigate to the HomeScreen after successful login
          Navigator.pushReplacementNamed(context, '/home');
        }),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),
        '/changePassword': (context) => ChangePasswordScreen(),
      },
    );
  }
}
