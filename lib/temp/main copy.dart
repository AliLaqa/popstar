// import 'package:flutter/material.dart';
// import 'homepage.dart';

// void main() {
//   runApp(const MyApp());
// }
// const navyBlue = MaterialColor(
//   0x020211,
//   <int, Color>{
//     50: Color(0x00020211),
//     100: Color(0x00020211),
//     200: Color(0x00020211),
//     300: Color(0x00020211),
//     400: Color(0x00020211),
//     500: Color(0x00020211),
//     600: Color(0x00020211),
//     700: Color(0x00020211),
//     800: Color(0x00020211),
//     900: Color(0x00020211),
//   },
// );
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});




//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: navyBlue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {

//   @override
//    Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 2, 2, 17), // navy background color
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 50),
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 30),
//               child: Text(
//                 "Let your\nPhoto",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 40,
//                   fontWeight: FontWeight.bold,
//                   // fontFamily: 'Pacifico', // custom font for heading
//                 ),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 30),
//               child: Text(
//                 "Art Change",
//                 style: TextStyle(
//                   color: Colors.blueAccent, // blue color for Art Change
//                   fontSize: 40,
//                   fontWeight: FontWeight.bold,
//                   // fontFamily: 'Pacifico', // custom font for heading
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 30),
//               child:  Row(
//                 children: [
//                   const Text(
//                     "Get Started",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       // fontFamily: 'Montserrat', // custom font for button
//                     ),
//                   ),
//                   const SizedBox(width: 10),
                  
//                   ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => HomePage()),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 shape: const CircleBorder(), backgroundColor: Colors.pink,
//                 padding: const EdgeInsets.all(16.0),
//               ),
//               child: const Icon(Icons.arrow_forward),
//             ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 50),
//             Expanded(
//               child: Container(
//                 decoration: const BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage('assets/images/Girl.png'),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }



// }
