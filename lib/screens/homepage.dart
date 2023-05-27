
import 'dart:async';
import 'dart:io';
import 'dart:math';

// import 'package:image_picker/image_picker.dart';
// import 'package:image_cropper/image_cropper.dart';
import 'package:flutter/material.dart';
import 'package:popstar/helper/image_helper.dart';
// // import 'package:popstar/screens/share.dart';
// import 'package:popstar/screens/upload.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../helper/helper.dart';

final imageHelper = ImageHelper();

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _image;
  List<File> savedImages = ImageSaver.savedImages;

  @override
  void initState() {
    // TODO: implement initState
    ImageSaver.loadSavedImages();
    savedImages = ImageSaver.savedImages;

    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 2, 2, 17),
      ),
      backgroundColor: Color.fromARGB(255, 2, 2, 17),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 16.0),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 17, 17, 17),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: StaggeredGridView.countBuilder(
                    itemCount: savedImages.length,
                    crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => ShareScreen(image: savedImages[index]),
                          //   ),
                          // );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: FutureBuilder<Size>(
                            future: getImageHeight(savedImages[index]),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return Container();
                              }
                              final imageSize = snapshot.data!;
                              final aspectRatio = imageSize.width / imageSize.height;
                              final height = MediaQuery.of(context).size.width / 2 / aspectRatio;
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    image: FileImage(savedImages[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                height: height,
                              );
                            },
                          ),
                        ),
                      );
                    },
                    staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              GestureDetector(
                onTap: () async {
                  // final file = await imageHelper.pickImage();
                  //
                  // if (file != null) {
                  //   setState(() {
                  //     _image = File(file.path);
                  //   });
                  //
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => UploadScreen(image: _image),
                  //     ),
                  //   );
                  // }
                },
                child: Container(
                  height: 64.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    gradient: LinearGradient(
                      colors: [Colors.purple, Colors.pink],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Upload New Photo',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
            ],
          )),
    );
  }

  Future<Size> getImageHeight(File imageFile) async {
    // final Completer<ImageInfo> completer = Completer();
    var decodedImage = await decodeImageFromList(imageFile.readAsBytesSync());
    // final img = await decodeImageFromList(await imageFile.readAsBytes());
    // completer.complete(img);
    // final ImageInfo info = await completer.future;
    // return info.image.height.toDouble();
    Size abc =
    Size(decodedImage.width.toDouble(), decodedImage.height.toDouble());
    return abc;
  }
}







/// Original File Backup
// import 'dart:async';
// import 'dart:io';
// import 'dart:math';
//
// // import 'package:image_picker/image_picker.dart';
// // import 'package:image_cropper/image_cropper.dart';
// import 'package:flutter/material.dart';
// import 'package:popstar/helper/image_helper.dart';
// import 'package:popstar/screens/share.dart';
// import 'package:popstar/screens/upload.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import '../helper/helper.dart';
//
// final imageHelper = ImageHelper();
//
// class HomePage extends StatefulWidget {
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   File? _image;
//   List<File> savedImages = ImageSaver.savedImages;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     ImageSaver.loadSavedImages();
//     savedImages = ImageSaver.savedImages;
//
//     setState(() {});
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Define grid images
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 2, 2, 17),
//         // leading: IconButton(
//         //   icon: Icon(Icons.arrow_back),
//         //   onPressed: () => Navigator.of(context).pop(),
//         // ),
//       ),
//       backgroundColor:
//       Color.fromARGB(255, 2, 2, 17), // set background color to navy blue
//       body: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               SizedBox(height: 16.0),
//               Expanded(
//                 child: Container(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 10, horizontal: 10),
//                     decoration: BoxDecoration(
//                       color: Color.fromARGB(255, 17, 17, 17),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: MasonryGridView.count(
//                       itemCount: savedImages.length,
//                       crossAxisCount: 2,
//                       mainAxisSpacing: 4,
//                       crossAxisSpacing: 4,
//                       itemBuilder: (context, index) {
//                         return GestureDetector(
//                           onTap: () {
//                             // Navigator.push(
//                             //   context,
//                             //   MaterialPageRoute(
//                             //     builder: (context) =>
//                             //         ShareScreen(image: savedImages[index]),
//                             //   ),
//                             // );
//                           },
//                           child: Card(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8.0),
//                             ),
//                             child: FutureBuilder<Size>(
//                               future: getImageHeight(savedImages[index]),
//                               builder: (context, snapshot) {
//                                 if (!snapshot.hasData) {
//                                   return Container();
//                                 }
//                                 final imageSize = snapshot.data!;
//                                 final aspectRatio =
//                                     imageSize.width / imageSize.height;
//                                 final height =
//                                     MediaQuery.of(context).size.width /
//                                         2 /
//                                         aspectRatio;
//                                 return Container(
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(8.0),
//                                     image: DecorationImage(
//                                       image: FileImage(savedImages[index]),
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                   height: height,
//                                 );
//                               },
//                             ),
//                           ),
//                         );
//                       },
//                     )),
//               ),
//               SizedBox(height: 16.0),
//               GestureDetector(
//                 onTap: () async {
//                   final file = await imageHelper.pickImage();
//
//                   if (file != null) {
//                     setState(() {
//                       _image = File(file.path);
//                     });
//
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => UploadScreen(image: _image),
//                       ),
//                     );
//                   }
//                 },
//                 child: Container(
//                   height: 64.0,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(16.0),
//                     gradient: LinearGradient(
//                       colors: [Colors.purple, Colors.pink],
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                     ),
//                   ),
//                   child: Center(
//                     child: Text(
//                       'Upload New Photo',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 16.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 16.0),
//             ],
//           )),
//     );
//   }
//
//   Future<Size> getImageHeight(File imageFile) async {
//     // final Completer<ImageInfo> completer = Completer();
//     var decodedImage = await decodeImageFromList(imageFile.readAsBytesSync());
//     // final img = await decodeImageFromList(await imageFile.readAsBytes());
//     // completer.complete(img);
//     // final ImageInfo info = await completer.future;
//     // return info.image.height.toDouble();
//     Size abc =
//     Size(decodedImage.width.toDouble(), decodedImage.height.toDouble());
//     return abc;
//   }
// }

