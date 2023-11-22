import 'package:flutter/material.dart';
import 'package:myapp/auth.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (choice) {
              if (choice == 'profile') {
                // Navigate to the profile page
                // You should define the route for the profile page in main.dart
                Navigator.pushNamed(context, '/profile');
              } else if (choice == 'signout') {
                // Sign out the user
                AuthService().signOut();
                // You can add code to navigate back to the login page or perform other actions as needed.
                Navigator.pushNamed(context, '/login');
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'profile',
                  child: Text('Profile Page'),
                ),
                PopupMenuItem<String>(
                  value: 'signout',
                  child: Text('Sign Out'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to the Home Page!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement other actions here
              },
              child: Text('Other Action'),
            ),
          ],
        ),
      ),
    );
  }
}
