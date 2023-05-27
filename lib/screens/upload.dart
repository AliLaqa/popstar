import 'package:flutter/material.dart';
import 'package:popstar/temp/background.dart';
import 'package:popstar/screens/loading.dart';
import 'package:popstar/temp/music.dart';
import 'dart:io';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:popstar/temp/payment.dart';
import 'package:popstar/screens/share.dart';

class UploadScreen extends StatefulWidget {
  final File? image;

  UploadScreen({required this.image});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  // late final List<Map<String, dynamic>> _images = [
  //   {
  //     "id": 1,
  //     "name": "Pop",
  //     "type": "music",
  //     "image":
  //         "https://images.unsplash.com/photo-1576514129883-2f1d47a65da6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8c3RhZ2V8ZW58MHx8MHx8&w=1000&q=80"
  //   },
  // ];

  bool _isPaidUser = false;

  void _removeImage(int index) {
    setState(() {
      // _images.removeAt(index);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 2, 2, 17),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 2, 2, 17),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
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
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              image: DecorationImage(
                                image: FileImage(widget.image!),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: SizedBox(
                              height: 450,
                              width: double.infinity,
                            ),
                          ),
                          Positioned(
                            top: 16,
                            right: 16,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                icon: Icon(Icons.close),
                                color: Colors.black,
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                            ),
                          ),
                          // Positioned(
                          //   bottom: 0,
                          //   left: 0,
                          //   right: 0,
                          //   child: SizedBox(
                          //     height: 120,
                          //     child: ListView.builder(
                          //       scrollDirection: Axis.horizontal,
                          //       itemCount: _images.length,
                          //       itemBuilder: (BuildContext context, int index) {
                          //         return Padding(
                          //             padding: EdgeInsets.all(8),
                          //             child: Stack(children: [
                          //               GestureDetector(
                          //                 onTap: () {
                          //                   // handle image tap
                          //                 },
                          //                 child: ClipRRect(
                          //                   borderRadius:
                          //                       BorderRadius.circular(8),
                          //                   child: Image.network(
                          //                     _images[index]['image'],
                          //                     height: 100,
                          //                     width: 100,
                          //                     fit: BoxFit.cover,
                          //                   ),
                          //                 ),
                          //               ),
                          //               Positioned(
                          //                 top: 0,
                          //                 right: 0,
                          //                 child: Container(
                          //                   decoration: BoxDecoration(
                          //                     borderRadius:
                          //                         BorderRadius.circular(50),
                          //                     boxShadow: [
                          //                       BoxShadow(
                          //                         color: Colors.white
                          //                             .withOpacity(0.5),
                          //                         spreadRadius: -10,
                          //                         blurRadius: 5,
                          //                         offset: Offset(0, 0),
                          //                       ),
                          //                     ],
                          //                   ),
                          //                   child: IconButton(
                          //                     iconSize: 16,
                          //                     padding: EdgeInsets.all(4),
                          //                     icon: Icon(Icons.close),
                          //                     onPressed: () =>
                          //                         _removeImage(index),
                          //                   ),
                          //                 ),
                          //               ),
                          //             ]));
                          //       },
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          // Row(
                          //   children: [
                          //     Expanded(
                          //       child: Padding(
                          //         padding: const EdgeInsets.only(right: 8.0),
                          //         child: ElevatedButton(
                          //           onPressed: () {
                          //             Navigator.push(
                          //               context,
                          //               MaterialPageRoute(
                          //                   builder: (context) => MusicPage()),
                          //             ).then((value) {
                          //               if (value != null) {
                          //                 addItem(value);
                          //               }
                          //             });
                          //           },
                          //           child: Text('Music'),
                          //           style: ButtonStyle(
                          //             backgroundColor:
                          //                 MaterialStateProperty.all<Color>(
                          //                     Color.fromARGB(255, 2, 2, 17)),
                          //             foregroundColor:
                          //                 MaterialStateProperty.all<Color>(
                          //                     Colors.lightGreenAccent),
                          //             shape: MaterialStateProperty.all<
                          //                 OutlinedBorder>(
                          //               RoundedRectangleBorder(
                          //                 side: BorderSide(
                          //                     color: Colors.lightGreenAccent),
                          //                 borderRadius:
                          //                     BorderRadius.circular(8.0),
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //     Expanded(
                          //       child: Padding(
                          //         padding: const EdgeInsets.only(left: 8.0),
                          //         child: ElevatedButton(
                          //           onPressed: () {
                          //             Navigator.push(
                          //                     context,
                          //                     MaterialPageRoute(
                          //                         builder: (context) =>
                          //                             BackgroundPage()))
                          //                 .then((value) {
                          //               if (value != null) {
                          //                 addItem(value);
                          //               }
                          //             });
                          //           },
                          //           child: Text('Background'),
                          //           style: ButtonStyle(
                          //             backgroundColor:
                          //                 MaterialStateProperty.all<Color>(
                          //                     Color.fromARGB(255, 2, 2, 17)),
                          //             foregroundColor:
                          //                 MaterialStateProperty.all<Color>(
                          //                     Colors.lightGreenAccent),
                          //             shape: MaterialStateProperty.all<
                          //                 OutlinedBorder>(
                          //               RoundedRectangleBorder(
                          //                 side: BorderSide(
                          //                     color: Colors.lightGreenAccent),
                          //                 borderRadius:
                          //                     BorderRadius.circular(8.0),
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // SizedBox(
                          //   width: double.infinity,
                          //   child: ElevatedButton(
                          //     onPressed: () {
                          //       // Navigator.push(
                          //       //   context,
                          //       //   MaterialPageRoute(
                          //       //       builder: (context) => LoadingScreen()),
                          //       // );
                          //     },
                          //     child: Text('Randomize'),
                          //     style: ButtonStyle(
                          //       backgroundColor:
                          //           MaterialStateProperty.all<Color>(
                          //               Color.fromARGB(255, 2, 2, 17)),
                          //       foregroundColor:
                          //           MaterialStateProperty.all<Color>(
                          //               Colors.lightGreenAccent),
                          //       shape:
                          //           MaterialStateProperty.all<OutlinedBorder>(
                          //         RoundedRectangleBorder(
                          //           side: BorderSide(
                          //               color: Colors.lightGreenAccent),
                          //           borderRadius: BorderRadius.circular(8.0),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            height: 8.0,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async {
                  // if (!_isPaidUser) {
                  //   final result = await Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => ShareScreen(image: widget.image!)),
                  //   );
                  //   if (result != null) {
                  //     setState(() {
                  //       _isPaidUser = true;
                  //     });
                  //   }
                  // } else {

                  ///Commenting out LoadingScreen Push to Display Reward Ads
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            LoadingScreen(photo: widget.image)),
                  );

                  // ///Displaying Rewarded Ads
                  // _showRewardedAd;


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
                      'Make me a Pop-Star',
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
          ),
        ));
  }

  // void addItem(value) {
  //   setState(() {
  //     _images.add(value);
  //   });
  // }
}
