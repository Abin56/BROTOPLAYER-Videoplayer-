// ignore_for_file: deprecated_member_use
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../Fetching files/InnerFetching/fetch_video_data.dart';
import '../../homescreen.dart';
class Onboardingpage extends StatefulWidget {
  const Onboardingpage({Key? key}) : super(key: key);

  @override
  State<Onboardingpage> createState() => _OnboardingpageState();
}

class _OnboardingpageState extends State<Onboardingpage> {
  @override
  void initState() {
  splashFetch();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: IntroductionScreen(
        showBackButton: false,
        showNextButton: true,
        pages: [
          PageViewModel(
            image:
                const Image(image: AssetImage('asset/images/Brototype2.0.jpg')),
            title: 'WELCOME TO ',
            body: 'B R O T O P L A Y E R',
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            image:
                const Image(image: AssetImage('asset/images/play button.jpg')),
            title: 'One stop for your \n Multimedia play',
            body: 'B R O T O P L A Y E R',
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            image: const Image(image: AssetImage('asset/images/power3.png')),
            title: 'Welcome  to the world of \n Entertainment',
            body: 'B R O T O P L A Y E R',
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            image: const Image(image: AssetImage('asset/images/welcome.jpg')),
            title: 'Thank you for your patience\n Please Wait.... ',
            body: 'B R O T O P L A Y E R',
            decoration: getPageDecoration(),
            footer: ButtonWidget(
              text: 'Lauch App ',
              onClicked: () => goToHome(context),
            ),
          ),
        ],
        done: const Text(
          'Read',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        onDone: () => goToOnboard(context),
        showSkipButton: true,
        skip: const Text('Skip', style: TextStyle(color: Colors.white)),
        next: const Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
        onChange: (index) => log('page $index selected'),
        dotsDecorator: getDotsDecorator(),
        animationDuration: 3000,
      ),
    );
  }

  void goToHome(context) => Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (_) => const Homescreen()));

  void goToOnboard(context) => Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const Onboardingpage()));

  // Widget buildimages(String path) {
  PageDecoration getPageDecoration() => const PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, color: Colors.white),
        bodyTextStyle: TextStyle(
          fontSize: 30,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        imagePadding: EdgeInsets.all(2),
      );

  DotsDecorator getDotsDecorator() => DotsDecorator(
      color: Colors.amber,
      activeColor: Colors.red,
      size: const Size(12, 12),
      activeSize: const Size(22, 10),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ));
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => RaisedButton(
        onPressed: onClicked,
        color: Colors.orange,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      );
}
