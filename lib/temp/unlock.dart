// import 'dart:io';
// import 'dart:typed_data';
// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:popstar/screens/share.dart';

// class UnlockScreen extends StatelessWidget {
//   final File image;

//   UnlockScreen({required this.image});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 2, 2, 17),
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () =>
//               Navigator.of(context).popUntil((route) => route.isFirst),
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Expanded(
//               child: Stack(
//                 children: [
//                   Card(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(16.0),
//                     ),
//                     child: Stack(
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(16.0),
//                             image: DecorationImage(
//                               // image: MemoryImage(image),
//                               image: FileImage(image),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           height: 450,
//                           width: double.infinity,
//                           child: BackdropFilter(
//                             filter: new ImageFilter.blur(
//                                 sigmaX: 10.0, sigmaY: 10.0),
//                             child: new Container(
//                               decoration: new BoxDecoration(
//                                   color: Colors.white.withOpacity(0.0)),
//                             ),
//                           ),
//                         ),
//                         Positioned.fill(
//                           child: Align(
//                             alignment: Alignment.center,
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 color: Colors.white.withOpacity(0.5),
//                                 shape: BoxShape.circle,
//                               ),
//                               child: IconButton(
//                                 icon: Icon(Icons.lock),
//                                 color: Colors.black,
//                                 onPressed: () => Navigator.of(context).pop(),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 0,
//                     left: 0,
//                     right: 0,
//                     child: Column(
//                       children: [
//                         Center(
//                           child: Text(
//                               "You're an Icon.\nPay to unlock. One-time fee or subscribe for unlimited photos. Enjoy!",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16.0,
//                                 height: 1.5,
//                               ),
//                               textAlign: TextAlign.center),
//                         ),
//                         SizedBox(
//                           height: 32.0,
//                         ),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: Padding(
//                                 padding: const EdgeInsets.only(right: 8.0),
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(8.0),
//                                     gradient: LinearGradient(
//                                       colors: [Colors.purple, Colors.pink],
//                                       begin: Alignment.topLeft,
//                                       end: Alignment.bottomRight,
//                                     ),
//                                   ),
//                                   child: GestureDetector(
//                                     onTap: () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (context) =>
//                                               ShareScreen(image: image),
//                                         ),
//                                       );
//                                     },
//                                     child: Padding(
//                                       padding: EdgeInsets.symmetric(
//                                         vertical: 12.0,
//                                         horizontal: 24.0,
//                                       ),
//                                       child: Center(
//                                         child: Text(
//                                           'One-Time Payment',
//                                           style: TextStyle(
//                                             color: Colors.white,
//                                             fontSize: 12.0,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               child: Padding(
//                                 padding: const EdgeInsets.only(left: 8.0),
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(8.0),
//                                     gradient: LinearGradient(
//                                       colors: [Colors.purple, Colors.pink],
//                                       begin: Alignment.topLeft,
//                                       end: Alignment.bottomRight,
//                                     ),
//                                   ),
//                                   child: GestureDetector(
//                                     onTap: () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (context) =>
//                                               ShareScreen(image: image),
//                                         ),
//                                       );
//                                     },
//                                     child: Padding(
//                                       padding: EdgeInsets.symmetric(
//                                         vertical: 12.0,
//                                         horizontal: 24.0,
//                                       ),
//                                       child: Center(
//                                         child: Text(
//                                           'Subscribe',
//                                           style: TextStyle(
//                                             color: Colors.white,
//                                             fontSize: 12.0,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 64.0),
//           ],
//         ),
//       ),
//     );
//   }
// }
