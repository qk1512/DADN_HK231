import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MainFunctionScreen extends StatefulWidget {
  const MainFunctionScreen({Key? key}) : super(key: key);

  @override
  _MainFunctionScreenState createState() => _MainFunctionScreenState();
}

class _MainFunctionScreenState extends State<MainFunctionScreen> {
  File? selectedPhoto;

  Future<void> _getImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        selectedPhoto = File(pickedFile.path);
      });
    }
  }

  Future<void> _getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        selectedPhoto = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadImage(File? image) async {
    try {
      if (image == null) {
        print('No selected image');
        return;
      }

      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://192.168.1.128:8000/upload'),
      );

      request.files.add(await http.MultipartFile.fromPath('image', image.path));

      var response = await request.send();

      if (response.statusCode == 200) {
        var data = await response.stream.bytesToString();
        var decodedData = jsonDecode(data);
        print('Upload successful: ${decodedData['query']}');
      } else {
        print('Image upload failed with status ${response.statusCode}');
        // Handle error as needed
      }
    } catch (e) {
      print('Error uploading image: $e');
      // Handle error as needed
    }
  }

  void _uploadSelectedImage() {
    _uploadImage(selectedPhoto);
    // Optionally, you can navigate to the next screen after uploading.
    Navigator.pushNamed(context, '/prediction');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Function'),
        actions: [
          if (selectedPhoto != null)
            IconButton(
              onPressed: _uploadSelectedImage,
              icon: const Icon(Icons.filter_vintage_outlined),
            ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _getImageFromCamera,
            tooltip: 'Take a Picture',
            child: const Icon(Icons.camera_alt),
          ),
          const SizedBox(height: 16.0),
          FloatingActionButton(
            onPressed: _getImageFromGallery,
            tooltip: 'Pick from Gallery',
            child: const Icon(Icons.photo_library),
          ),
        ],
      ),
    );
  }
}
