// import 'package:flutter/material.dart';
// import 'package:popstar/screens/loading.dart';
// import 'package:popstar/temp/unlock.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// class MusicPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Define grid images
//     final List<Map<String, dynamic>> _items = [
//       {
//         "id": 1,
//         "name": "Pop",
//         "type": "music",
//         "image":
//             "https://images.unsplash.com/photo-1576514129883-2f1d47a65da6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8c3RhZ2V8ZW58MHx8MHx8&w=1000&q=80"
//       },
//       {
//         "id": 2,
//         "name": "Rock",
//         "type": "music",
//         "image":
//             "https://img.freepik.com/premium-photo/colorful-background-with-bokeh-defocused-blurred-multicolored-lights_118086-1476.jpg"
//       },
//       {
//         "id": 3,
//         "name": "Hip-Hop",
//         "type": "music",
//         "image":
//             "https://images.unsplash.com/photo-1563841930606-67e2bce48b78?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8Y29uY2VydHxlbnwwfHwwfHw%3D&w=1000&q=80"
//       },
//       {
//         "id": 4,
//         "name": "R&B",
//         "type": "music",
//         "image":
//             "https://images.unsplash.com/photo-1545128485-c400e7702796?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Y2x1YiUyMHBhcnR5fGVufDB8fDB8fA%3D%3D&w=1000&q=80"
//       },
//       {
//         "id": 5,
//         "name": "Country",
//         "type": "music",
//         "image":
//             "https://img.freepik.com/premium-vector/show-light-podium-purple-background-vector-illustration_3482-4443.jpg"
//       },
//       {
//         "id": 5,
//         "name": "Jazz",
//         "type": "music",
//         "image":
//             "https://img.freepik.com/premium-vector/show-light-podium-purple-background-vector-illustration_3482-4443.jpg"
//       },
//       {
//         "id": 5,
//         "name": "Blues",
//         "type": "music",
//         "image":
//             "https://img.freepik.com/premium-vector/show-light-podium-purple-background-vector-illustration_3482-4443.jpg"
//       },
//       {
//         "id": 5,
//         "name": "Electronic",
//         "type": "music",
//         "image":
//             "https://img.freepik.com/premium-vector/show-light-podium-purple-background-vector-illustration_3482-4443.jpg"
//       },
//       {
//         "id": 5,
//         "name": "Classical",
//         "type": "music",
//         "image":
//             "https://img.freepik.com/premium-vector/show-light-podium-purple-background-vector-illustration_3482-4443.jpg"
//       },
//       {
//         "id": 5,
//         "name": "Reggae",
//         "type": "music",
//         "image":
//             "https://img.freepik.com/premium-vector/show-light-podium-purple-background-vector-illustration_3482-4443.jpg"
//       },
//       {
//         "id": 5,
//         "name": "Metal",
//         "type": "music",
//         "image":
//             "https://img.freepik.com/premium-vector/show-light-podium-purple-background-vector-illustration_3482-4443.jpg"
//       },
//       {
//         "id": 5,
//         "name": "Folk",
//         "type": "music",
//         "image":
//             "https://img.freepik.com/premium-vector/show-light-podium-purple-background-vector-illustration_3482-4443.jpg"
//       },
//       {
//         "id": 5,
//         "name": "Indie",
//         "type": "music",
//         "image":
//             "https://img.freepik.com/premium-vector/show-light-podium-purple-background-vector-illustration_3482-4443.jpg"
//       },
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 2, 2, 17),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: Text("Music"),
//       ),
//       backgroundColor:
//           Color.fromARGB(255, 2, 2, 17), // set background color to navy blue
//       body: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               SizedBox(height: 16.0),
//               Expanded(
//                 child: Container(
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                   decoration: BoxDecoration(
//                     color: Color.fromARGB(255, 17, 17, 17),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: MasonryGridView.count(
//                     itemCount: _items.length,
//                     // the number of columns
//                     crossAxisCount: 2,
//                     // vertical gap between two items
//                     mainAxisSpacing: 4,
//                     // horizontal gap between two items
//                     crossAxisSpacing: 4,
//                     itemBuilder: (context, index) {
//                       // display each item with a card
//                       return GestureDetector(
//                         onTap: () {
//                           Navigator.pop(context, _items[index]);
//                           print(_items[index]);
//                         },
//                         child: Card(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                           key: ValueKey(_items[index]['id']),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(8.0),
//                               image: DecorationImage(
//                                 image: NetworkImage((_items[index]['image'])),
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                             child: SizedBox(
//                               height: 150.0,
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               GestureDetector(
//                 onTap: () {
//                   // Navigator.push(
//                   //   context,
//                   //   MaterialPageRoute(builder: (context) => LoadingScreen()),
//                   // );
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
// }
