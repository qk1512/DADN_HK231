import 'package:flutter/material.dart';
import '../screen/login_screen.dart';
import '../screen/register_screen.dart';
import '../screen/home_screen.dart';
import '../screen/changePassword_screen.dart';
import '../screen/mainFunction_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/changePassword': (context) => const ChangePasswordScreen(),
        '/mainFunction': (context) => const MainFunctionScreen(),
      },
    );
  }
}
