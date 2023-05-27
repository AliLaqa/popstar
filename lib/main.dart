import 'package:flutter/material.dart';
import 'screens/homepage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {

  ///Initializing Google Ads SDK
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  runApp(const MyApp());
}

const navyBlue = MaterialColor(
  0x020211,
  <int, Color>{
    50: Color(0x00020211),
    100: Color(0x00020211),
    200: Color(0x00020211),
    300: Color(0x00020211),
    400: Color(0x00020211),
    500: Color(0x00020211),
    600: Color(0x00020211),
    700: Color(0x00020211),
    800: Color(0x00020211),
    900: Color(0x00020211),
  },
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: navyBlue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  ///Implementing Rewarded Ads below----------------------------------->

  //members
  //ads
  late final RewardedAd rewardedAd;

  //Sample AdUnit Id = "ca-app-pub-3940256099942544/5224354917";
  ///TODO: Change with real AdUnit Id before publishing
  ///Real AdUnit Id= "";
  final String rewardedAdUnitId = "ca-app-pub-3940256099942544/5224354917";

  ///Passing Rewarded Ads in initState, load Ads----------------------->
  @override
  void initState() {
    super.initState();

    //Load ad here...
    _loadRewardedAd();
  }

  void _loadRewardedAd() {
    RewardedAd.load(

      ///AdUnit
        adUnitId: rewardedAdUnitId,

        ///AdRequest
        request: const AdRequest(),

        rewardedAdLoadCallback: RewardedAdLoadCallback(
          //when failed to load
            onAdFailedToLoad: (LoadAdError error){
              print("Failed to Load Rewarded Ad, Error: $error");
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
            },
            //when suceeded to load
            onAdLoaded: (RewardedAd ad){
              print("$ad Successfully loaded Reward Ad");
              //Keep a referance to the ad so ypu can show it later
              rewardedAd = ad;

              //Set on full screen call back
              _setFullScreenContentCallback();

            }
        )
    );
  }

  ///Making method to show content call back------------------------------->
  void _setFullScreenContentCallback(){
    if(rewardedAd == null) return;
    rewardedAd.fullScreenContentCallback = FullScreenContentCallback(

      ///When ad show fullscreen
      onAdShowedFullScreenContent: (RewardedAd ad) => print("$ad onAdShowedFullScreenContent"),

      ///When ad dismissed by user
      onAdDismissedFullScreenContent: (RewardedAd ad){
        print("$ad onAdDismissedFullScreenContent");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );

        ///Disposing the dismissed ad
        ad.dispose();
      },

      ///When ad fails to show
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error){
        print("$ad onAdFailedToShowFullScreenContent: $error");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );

        ///Disposing failed to show ad
        ad.dispose();

      },

    );
  }

  ///Show ad method
  void _showRewardedAd(){
    ///this method takes on a user earned reward call back
    rewardedAd.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem rewardItem){
          //reward user for watching your ad
          num amount = rewardItem.amount;
          print("You earned: $amount");
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            const Color.fromARGB(255, 2, 2, 17), // navy background color
        body: FutureBuilder<void>(
            // future: _initGoogleMobileAds(),
            builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "Let your\nPhoto",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      // fontFamily: 'Pacifico', // custom font for heading
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "Art Change",
                    style: TextStyle(
                      color: Colors.blueAccent, // blue color for Art Change
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      // fontFamily: 'Pacifico', // custom font for heading
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      const Text(
                        "Get Started",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          // fontFamily: 'Montserrat', // custom font for button
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        // onPressed: () {
                        //
                        //   ///Commenting out push for testing Reward Ads
                        //   // Navigator.pushReplacement(
                        //   //   context,
                        //   //   MaterialPageRoute(builder: (context) => HomePage()),
                        //   // );
                        //
                        //
                        // },
                        onPressed: ///Displaying Rewarded Ads
                        _showRewardedAd,
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: Colors.pink,
                          padding: const EdgeInsets.all(16.0),
                        ),
                        child: const Icon(Icons.arrow_forward),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/Girl.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }));
  }

  // Future<InitializationStatus> _initGoogleMobileAds() {
  //   // TODO: Initialize Google Mobile Ads SDK
  //   return MobileAds.instance.initialize();
  // }
}
