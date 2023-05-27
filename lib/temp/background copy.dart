// import 'package:flutter/material.dart';
// import 'package:popstar/unlock.dart';
// import 'dart:math';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


// final List<Map<String, dynamic>> _items = List.generate(
//     200,
//     (index) => {
//           "id": index,
//           "title": "Item $index",
//           "height": Random().nextInt(150) + 50.5,
//           "image":
//               "https://jswtv.tv/wp-content/uploads/2022/08/Pic-Talk-Suhana-Khan-looks-a-million-bucks-in-a-mid-week-mirror-selfie-150x150.jpg"
//         });


// class BackgroundPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Define grid images
//     final List<String> images = [
//       'https://www.vectorgraphit.com/wp-content/uploads/2014/04/trianglify-background-31-150x150.jpg',
//       'https://phandroid.com/wp-content/uploads/2018/01/Galaxy-S9-wallpaper-150x150.jpg',
//       'https://www.publicdomainpictures.net/pictures/300000/t2/background-bleu-42.jpg',
//       'https://www.pcclean.io/wp-content/uploads/2019/04/874612-150x150.png',
//       'https://www.publicdomainpictures.net/pictures/230000/t2/light-blue-background.jpg',
//     ];

//     return MaterialApp(
//       title: 'My App',
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color.fromARGB(255, 2, 2, 17),
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back),
//             onPressed: () => Navigator.of(context).pop(),
//           ),
//           title: Text("Background"),
//         ),
//         backgroundColor:
//             Color.fromARGB(255, 2, 2, 17), // set background color to navy blue
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             SizedBox(height: 16.0),
//             Expanded(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 2.0),
//                 child: GridView.builder(
//                   padding: EdgeInsets.zero,
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     childAspectRatio: 1.2,
//                   ),
//                   itemCount: images.length,
//                   itemBuilder: (context, index) {
//                     return Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(16.0),
//                           ),
//                           child: Padding(
//                             padding: EdgeInsets.all(1.0),
//                             child: Image.network(images[index]),
//                           ),
//                         );
//                   },
//                 ),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.0),
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => UnlockScreen()),
//                   );
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
//                       'Make me a Pop Star',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 24.0,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 16,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
