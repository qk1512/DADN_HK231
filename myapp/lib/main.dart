import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myapp/screen/login_screen.dart';
import 'package:myapp/screen/forgotPassword_screen.dart';
import 'package:myapp/screen/prediction.dart';
import 'package:myapp/screen/register_screen.dart';
import 'package:myapp/screen/home_screen.dart';
import 'package:myapp/screen/changePassword_screen.dart';
import 'package:myapp/screen/mainFunction_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(); // Initialize Firebase
  } catch (e) {
    print('Error initializing Firebase: $e');
    // Handle the error, for example, show a dialog to the user
    return;
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // Customize other theme properties as needed
      ),
      home: LoginScreen(onLogin: () {
        // Navigate to the HomeScreen after successful login
        Navigator.pushReplacementNamed(context, '/home');
      }),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(onLogin: () {
              // Navigate to the HomeScreen after successful login
              Navigator.pushReplacementNamed(context, '/home');
            }),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/forgotPassword': (context) => ForgotPasswordScreen(),
        '/changePassword': (context) => ChangePasswordScreen(),
        '/mainFunction': (context) => const MainFunctionScreen(),
        '/prediction' :(context) => Predictor()
      },
    );
  }
}
