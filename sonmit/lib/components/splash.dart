import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:sonmit/pages/signin_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});


  get splash => null;


  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            AnimatedContainer(
              duration: Duration(seconds: 1),
              height: 0.3 * MediaQuery.of(context).size.height,
              child: Image.asset("assets/sonmit_transparent_icon.png"),
            ),
          ]),
        ),
      ),
      splashIconSize: 400,
      backgroundColor: const Color.fromARGB(255, 246, 83, 33),
      nextScreen: SigninPage(),
    );
  }
}
