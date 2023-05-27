import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../helper/helper.dart';
import 'package:share/share.dart';

// import 'package:gallery_saver/gallery_saver.dart';

class ShareScreen extends StatefulWidget {
  final File image;
  // final String image;

  ShareScreen({required this.image});

  @override
  State<ShareScreen> createState() => _ShareScreenState();
}

class _ShareScreenState extends State<ShareScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 2, 17),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.of(context).popUntil((route) => route.isFirst),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      image: DecorationImage(
                        // image: MemoryImage(image),
                        // image: FileImage(widget.image),
                        image: FileImage(widget.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: SizedBox(
                      height: 450,
                      width: double.infinity,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    // onSave(context, widget.image).then(
                                    //     (value) => Navigator.of(context)
                                    //         .popUntil(
                                    //             (route) => route.isFirst));
                                  },
                                  icon: Icon(Icons.save),
                                  label: Text('Save'),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color.fromARGB(255, 2, 2, 17)),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.lightGreenAccent),
                                    shape: MaterialStateProperty.all<
                                        OutlinedBorder>(
                                      RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.lightGreenAccent),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    // _shareImage(widget.image);
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(builder: (context) => BackgroundPage()),
                                    // );
                                  },
                                  icon: Icon(Icons.share),
                                  label: Text('Share'),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color.fromARGB(255, 2, 2, 17)),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.lightGreenAccent),
                                    shape: MaterialStateProperty.all<
                                        OutlinedBorder>(
                                      RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.lightGreenAccent),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 64.0),
          ],
        ),
      ),
    );
  }

  Future<bool> onSave(context, image) async {
    try {
      // Get the directory for the gallery folder
      Directory galleryDir = await getApplicationDocumentsDirectory();
      String galleryPath = galleryDir.path + '/PopStar';
      await Directory(galleryPath).create(recursive: true);

      // Copy the image to the gallery folder
      String filePath =
          '$galleryPath/${DateTime.now().millisecondsSinceEpoch}.jpg';
      File newImage = await image.copy(filePath);
      // await GallerySaver.saveImage(filePath);

      // Show a pop-up message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Image saved to gallery')),
      );

      // Add the image to the saved images list
      ImageSaver.savedImages.add(newImage);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> encodedImages = ImageSaver.savedImages
          .map((image) => json.encode(image.path))
          .toList();
      prefs.setStringList('saved_images', encodedImages);
      // setState(() {});
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<void> _shareImage(File? imageFile) async {
    if (imageFile != null) {
      await Share.shareFiles([imageFile.path], text: 'Sharing this image.');
    } else {
      print('Please select an image first.');
    }
  }
}
