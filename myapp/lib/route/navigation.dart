import 'package:flutter/material.dart';
import '../screen/login_screen.dart';
import '../screen/register_screen.dart';
import '../screen/home_screen.dart';
import '../screen/changePassword_screen.dart';
import '../screen/mainFunction_screen.dart';
import '../screen/forgotPassword_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
        }),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/changePassword': (context) => ChangePasswordScreen(),
        '/mainFunction': (context) => MainFunctionScreen(),
        '/forgotPassword': (context) => const ForgotPasswordScreen(),
      },
    );
  }
}




