import 'package:flutter/material.dart';
import 'package:myapp/auth.dart'; // Import your authentication service

class RegisterPage extends StatelessWidget {
  final AuthService authService = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Register',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  final email = emailController.text;
                  final password = passwordController.text;
                  final user = await authService.signUpWithEmailAndPassword(
                      email, password);
                  if (user != null) {
                    Navigator.pop(context);
                  }
                },
                child: Text('Register'),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Already have an account?'),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(
                          context); // Pop the current page (registration) off the stack
                    },
                    child: Text('Log In'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
