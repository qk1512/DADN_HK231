import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/HCMUT_official_logo.png',
              width: 100.0,
              height: 100.0,
            ),
            Text('Home Screen'),

            // Buttons for navigation
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text('Register'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/changePassword');
              },
              child: Text('Change Password'),
            ),
          ],
        ),
      ),
    );
  }
}
