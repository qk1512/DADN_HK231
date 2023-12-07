import 'package:flutter/material.dart';
import '../screen/mainFunction_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Screen'),

            // Buttons for navigation
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text('Register'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/changePassword');
              },
              child: const Text('Change Password'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/mainFunction');
              },
              child: const Text('Scan Image'),
            ),
          ],
        ),
      ),
    );
  }
}
