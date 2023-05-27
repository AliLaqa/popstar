import 'dart:convert';
// import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:popstar/screens/share.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class LoadingScreen extends StatefulWidget {
  // final List<Map<String, dynamic>> images;
  File? photo;

  LoadingScreen({required this.photo});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String prompt = "portrait of handsome man, 1face, 1man";

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  // Future<void> _loadData(String base64Image) async {
  Future<void> _loadData() async {
    print('part 1');

    File imageFile = widget.photo!;
    List<int> imageBytes = imageFile.readAsBytesSync();
    String base64 = base64Encode(imageBytes);

    File faceswap = await sendRequest(prompt, base64);

    // await Future.delayed(Duration(seconds: 2));

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ShareScreen(
                image: faceswap,
              )),
    );
    // });
  }

  @override
  Widget build(BuildContext context) {
    // List<Map<String, dynamic>> images = widget.images;

    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 2, 2, 17), // navy background color

      body: Center(
        child: LoadingAnimationWidget.beat(
          color: Colors.white,
          size: 200,
        ),
      ),
    );
  }

  @override
  void dispose() {
    // _rewardedAd?.dispose();
    super.dispose();
  }

  Future<File> sendRequest(String prompt, String base64Image) async {
    // final String url = 'http://192.168.10.6:8800/faceswap';
    final String url = 'http://103.111.39.182:8800/faceswap';

    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        'prompt': prompt,
        'source_image': base64Image,
      }),
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, write the byte data to a temporary file.
      final bytes = response.bodyBytes;

      // Get temporary directory.
      final directory = await getTemporaryDirectory();

      // Create a temporary file.
      final file = File('${directory.path}/temp_image.png');

      // Write the byte data to the file.
      await file.writeAsBytes(bytes);

      return file;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load response');
    }
  }
}
