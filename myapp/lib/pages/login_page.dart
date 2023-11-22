import 'package:flutter/material.dart';
import 'package:myapp/auth.dart';

class LoginPage extends StatelessWidget {
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
              Image.asset(
                'images/HCMUT_official_logo.png',
                height: 150,
                width: 150,
              ),
              SizedBox(height: 20),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email or Phone Number',
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
                  final user = await authService.signInWithEmailAndPassword(
                      email, password);
                  if (user != null) {
                    Navigator.pushNamed(context, '/home_page');
                  }
                },
                child: Text('Log In'),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text('Or'),
                  ),
                  Expanded(
                    child: Divider(),
                  ),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context,
                      '/forgot_password'); // Navigate to the registration page
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Set the background color to blue
                ),
                child: Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: Colors.white, // Set the text color to white
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Don't have an account?"),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context,
                          '/register'); // Navigate to the registration page
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // Set the background color to blue
                    ),
                    child: Text(
                      'Sign Up',
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
