// home_screen.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'menu_screen.dart';
import '../screen/mainFunction_screen.dart';
import '../models/photo_folder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PhotoFolder> folders = [
    PhotoFolder(name: 'Uploaded Photos', photos: []),
  ];

  void _updatePhotos(List<File> newPhotos) {
    setState(() {
      folders[0].photos.addAll(newPhotos);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        automaticallyImplyLeading: false, // Hide the back button
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MenuScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.menu),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Adjust the number of columns as needed
                ),
                itemCount: folders[0].photos.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.file(
                      folders[0].photos[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: FloatingActionButton(
          onPressed: () async {
            final newPhotos = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MainFunctionScreen(),
              ),
            );

            if (newPhotos != null && newPhotos is List<File>) {
              _updatePhotos(newPhotos);
            }
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}
