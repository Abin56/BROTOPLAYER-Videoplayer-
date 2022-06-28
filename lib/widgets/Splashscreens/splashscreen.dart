import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../Fetching files/InnerFetching/fetch_video_data.dart';

import '../../homescreen.dart';
import 'onboarding.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
        splashFetch();
    GoHomeScreen();

  

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset("asset/images/splashscreen logo.jpg"),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  GoHomeScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isOnBoard = prefs.getBool('seenonboard');
    if (isOnBoard == true) {
      await Future.delayed(const Duration(seconds: 5));
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const Homescreen()));
    } else {
      await Future.delayed(const Duration(seconds:5));
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const Onboardingpage()));
    }
  }
}
