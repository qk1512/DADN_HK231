import 'dart:io';

class PhotoFolder {
  final String name;
  final List<File> photos;

  PhotoFolder({required this.name, this.photos = const []});
}