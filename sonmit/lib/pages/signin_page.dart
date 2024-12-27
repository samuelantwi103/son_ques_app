// pages/signin_page.dart
// ignore_for_file: prefer_const_constructors

// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sonmit/components/card.dart';
// import 'package:sonmit/components/clipper.dart';
import 'package:sonmit/components/text_field.dart';

import 'package:sonmit/pages/student/home.dart';
import 'package:sonmit/pages/admin/home.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => SigninPageState();
}

class SigninPageState extends State<SigninPage> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();

  // Controllers to capture user input
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();

  final bool _isPinVisible = false;
  // bool _isCodeValid = false;

  // // Video Controller
  // late VideoPlayerController _controller;
  // late Future<void> _initializeVideoPlayerFuture;

  // @override
  // void initState() {
  //   super.initState();

  //   _controller = VideoPlayerController.asset(
  //     "assets/smoke_anim.mp4",
  //   );
  //   _controller.play();

  //   _initializeVideoPlayerFuture = _controller.initialize();
  // }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  // Fade In Animation
  late Animation<double> logoFadeAnimation;
  late Animation<Offset> formSlideAnimation;
  late AnimationController animationController;
  // late AnimationController fastAnimationController;

  @override
  void initState() {
    super.initState();
    // fastAnimationController = AnimationController(
    //   vsync: this,
    //   duration: const Duration(milliseconds: 5000),
    // );
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    // fastAnimationController.forward();
    // fastAnimationController.addStatusListener(
    //   (status) {
    //     if (status == AnimationStatus.completed) {
    //       fastAnimationController.reverse();
    //     } else if (status == AnimationStatus.dismissed) {
    //       fastAnimationController.forward();
    //     }
    //   },
    // );

    // fastAnimationController.repeat();
    // fastAnimationController.duration = Duration(seconds: 2);
    logoFadeAnimation =
        Tween<double>(begin: 0, end: 1).animate(animationController);
    formSlideAnimation = Tween<Offset>(begin: Offset(1, 1), end: Offset.zero)
        .animate(animationController);

    // fastAnimationController.forward();
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    // fastAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: FadeTransition(
          opacity: logoFadeAnimation,
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/books_1.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.2),
                  Color(0xffcf5500),
                  Color(0xffcf5500),
                  Color(0xffcf5500),
                  Color(0xffcf5500),
                  // Theme.of(context).colorScheme.primaryContainer,
                  // Theme.of(context).colorScheme.primaryContainer,
                  // Theme.of(context).colorScheme.primaryContainer,
                ],
              )),
              child: Center(
                child: Form(
                    key: _formKey,
                    child: Container(
                      // height: 200,
                      constraints: BoxConstraints(
                        maxWidth: 500,
                        minWidth: 300,
                      ),
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                minHeight: 250
                              ),
                              height: 0.3 * MediaQuery.sizeOf(context).height,
                              child: Image.asset(
                                'assets/sonmit-transparent.png',
                                // width: 0.3 *
                                //     MediaQuery.sizeOf(context)
                                //         .height, // Replace with your image
                              ),
                            ),
                            // AnimatedContainer(
                            //   duration: Duration(seconds: 1),
                            //   height: 0.3 * MediaQuery.sizeOf(context).height,
                            //   constraints: BoxConstraints(minHeight: 150),
                            //   decoration: BoxDecoration(
                            //     image: DecorationImage(image:AssetImage(("assets/sonmit-transparent.png"),)  ),
                            //     boxShadow: [
                            //       BoxShadow(
                            //         color: Theme.of(context).colorScheme.primary
                            //       )
                            //     ]
                            //   ),

                            // ),
                            const SizedBox(height: 0),
                            // CODE
                            ElevatedFormTextField(
                              controller: _codeController,
                              maxLength: 8,
                              // labelText: "Code",
                              hintText: "C O D E",
                              prefixIcon: const Icon(Icons.vpn_key_outlined),
                              filled: true,
                              filledColor: Color(0xffcf5500),
                              keyboardType: TextInputType.text,
                              // validator: (value) {
                              //   if (value == null || value.isEmpty) {
                              //     return "Enter your code";
                              //   }

                              //   if (!RegExp(r'[A-Za-z]{3}[A-Za-z0-9]{5}$')
                              //       .hasMatch(value)) {
                              //     return 'Please enter a valid code: eg.sonss001';
                              //   }
                              //   if (value.isNotEmpty &&
                              //       !RegExp(r'[A-Za-z]{3}[A-Za-z0-9]{5}$')
                              //           .hasMatch(value)) {
                              //     setState(() {
                              //       _isCodeValid = false;
                              //     });
                              //   }
                              //   return null;
                              // },
                            ),
                            const SizedBox(height: 24),
                            // PIN
                            ElevatedFormTextField(
                              controller: _pinController,
                              // keyboardType: TextInputType.numberWithOptions(
                              //   decimal: false,
                              //   signed: false,
                              // ),
                              // maxLength: 4,
                              obscureText: !_isPinVisible,
                              // inputFormatters: [
                              //   FilteringTextInputFormatter.digitsOnly
                              // ],
                              // obscuringCharacter: "*",
                              // labelText: "PIN",
                              hintText: "P I N",
                              // filled: true,

                              // fillColor: Theme.of(context).colorScheme.primaryContainer,
                              prefixIcon: Icon(Icons.lock_outline),
                              hassuffixIcon: true,
                              filled: true,
                              filledColor: Color(0xffcf5500),

                              // validator: (value) {
                              //   if (value == null || value.isEmpty) {
                              //     return "Enter your PIN";
                              //   }
                              //   if (value.length != 4) {
                              //     return "PIN must be 4 digits";
                              //   }
                              //   return null;
                              // },
                            ),
                            const SizedBox(height: 32),
                            ElevatedCard(
                              // clipper: OctagonClipper(),
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              borderRadius: BorderRadius.circular(30),
                              color: Color(0xFFFFF1E7),
                              shadowColorLow: Color(0xFFF1A873),
                              shadowColorHigh: Color(0xFF984001),
                              child: TextButton(
                                style: ButtonStyle(
                                    foregroundColor: WidgetStatePropertyAll(
                                        Color(0xffcf5500))),
                                // elevation:,
                                // color: Theme.of(context).colorScheme.surface,
                                // padding: EdgeInsets.symmetric(
                                //     horizontal: 40, vertical: 20),
                                // shape: StarBorder.polygon(
                                //     sides: 8,
                                //     rotation: 22.5,
                                //     squash: 0.8,
                                //     pointRounding: 0.4),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    final code = _codeController.text.trim();
                                    final pin = _pinController.text.trim();
                                    // ScaffoldMessenger.of(context).showSnackBar(
                                    //     SnackBar(
                                    //         content: Text(
                                    //             'Logging in with code: $code pin:$pin')));
                                    if (pin == "1") {
                                      Navigator.pushReplacement(
                                          context,
                                          // slideLeftTransition(HomePage())
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AdminHomePage()));
                                    } else {
                                      Navigator.pushReplacement(
                                          context,
                                          // slideLeftTransition(HomePage())
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomePage(
                                                    reset: true,
                                                  )));
                                    }
                                    // LoginLoading(context);
                                  }
                                },
                                child: Text("L O G I N"),
                              ),
                            ),
                            // SizedBox(height: 10),
                            // GradientButton(text: "Login", onPressed: () {}),
                            SizedBox(
                              height: 50,
                            ),
                            // DebossedCard(
                            //     padding: EdgeInsets.symmetric(horizontal: 16),
                            //     borderRadius: BorderRadius.circular(30),
                            //     color: Color(0xffcf5500),
                            //     shadowColorLow: Color(0xFFF1A873),
                            //     shadowColorHigh: Color(0xFF984001),
                            //     child: Padding(
                            //       padding: const EdgeInsets.all(20.0),
                            //       child: Text("Hello"),
                            //     ))
                          ],
                        ),
                      ),
                    )),
              ),
            ),
          ),
        ));
  }
}
