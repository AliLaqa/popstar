import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageSaver {
  static List<File> savedImages = [];

  static Future<void> loadSavedImages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> encodedImages = prefs.getStringList('saved_images') ?? [];
    List<File?> files =
        await Future.wait(encodedImages.map((encodedImage) async {
      File imageFile = File(encodedImage);
      bool exists = await imageFile.exists();
      return exists ? imageFile : null;
    }));
    savedImages = files.whereType<File>().toList();
  }
}
