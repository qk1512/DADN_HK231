import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String username;
  final String email;

  ProfilePage({required this.username, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'User Information:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text('Username: $username'),
            SizedBox(height: 8),
            Text('Email: $email'),
          ],
        ),
      ),
    );
  }
}
