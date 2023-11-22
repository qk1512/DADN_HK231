import 'package:flutter/material.dart';
import 'package:myapp/auth.dart'; // Import your authentication service

class ForgotPasswordPage extends StatelessWidget {
  final AuthService authService = AuthService();
  final TextEditingController emailController = TextEditingController();

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
                'Forgot Password',
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
              ElevatedButton(
                onPressed: () async {
                  final email = emailController.text;
                  await authService.sendPasswordResetEmail(email);
                  // Display a message indicating that a password reset email has been sent
                },
                child: Text('Send Password Reset Email'),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Remember your password?'),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context,
                          '/login'); // Navigate to the registration page
                    },
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        color: Colors.white, // Set the text color to white
                      ),
                    ),
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
