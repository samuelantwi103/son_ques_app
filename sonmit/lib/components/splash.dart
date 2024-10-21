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
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              height: 0.3 * MediaQuery.sizeOf(context).height,
              child: Image.asset("assets/sonmit_transparent_icon.png"),
            ),
          ]),
        ),
      ),
      splashIconSize: 400,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      nextScreen: const SigninPage(),
    );
  }
}
