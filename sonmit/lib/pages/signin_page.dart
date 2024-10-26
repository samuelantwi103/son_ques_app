// pages/signin_page.dart
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:sonmit/pages/student/home.dart';

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

  bool _isPinVisible = false;
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
        extendBody: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
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
                  Theme.of(context).colorScheme.primaryContainer.withOpacity(0.2),
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context).colorScheme.primaryContainer,
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
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AnimatedContainer(
                              duration: Duration(seconds: 1),
                              height: 0.3 * MediaQuery.sizeOf(context).height,
                              constraints: BoxConstraints(
                                minHeight: 150
                              ),
                              child:
                                  Image.asset("assets/sonmit-transparent.png"),
                            ),
                            const SizedBox(height: 32),
                            // CODE
                            TextFormField(
                              controller: _codeController,
                              onTapOutside: (event) =>
                                  FocusScope.of(context).unfocus(),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              maxLength: 8,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                                labelStyle: TextStyle(
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                                errorStyle: TextStyle(
                                  color: Theme.of(context).colorScheme.onError,
                                ),
                                prefixIconColor:
                                    Theme.of(context).colorScheme.surface,
                                focusColor:
                                    Theme.of(context).colorScheme.surface,
                                hoverColor:
                                    Theme.of(context).colorScheme.surface,
                                suffixIconColor:
                                    Theme.of(context).colorScheme.surface,
                                labelText: "Code",
                                hintText: "Enter your code",
                                prefixIcon: const Icon(Icons.vpn_key_outlined),
                                // filled: true,
                                border: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                counter: const SizedBox(
                                  height: 0,
                                ),
                              ),
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onError,
                              ),
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
                            TextFormField(
                              onTapOutside: (event) =>
                                  FocusScope.of(context).unfocus(),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
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
                              decoration: InputDecoration(
                                labelText: "PIN",
                                hintText: "Enter your PIN",
                                // filled: true,
                                counter: const SizedBox(
                                  height: 0,
                                ),
                                hintStyle: TextStyle(
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                                labelStyle: TextStyle(
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                                errorStyle: TextStyle(
                                  color: Theme.of(context).colorScheme.onError,
                                ),
                                prefixIconColor:
                                    Theme.of(context).colorScheme.surface,
                                focusColor:
                                    Theme.of(context).colorScheme.surface,
                                hoverColor:
                                    Theme.of(context).colorScheme.surface,
                                suffixIconColor:
                                    Theme.of(context).colorScheme.surface,
                                // fillColor: Theme.of(context).colorScheme.primaryContainer,
                                prefixIcon: Icon(Icons.lock_outline),
                                border: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _isPinVisible = !_isPinVisible;
                                    });
                                  },
                                  icon: Icon(_isPinVisible
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined),
                                ),
                              ),
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onError,
                              ),
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
                            MaterialButton(
                              color: Theme.of(context).colorScheme.surface,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 20),
                              shape: StarBorder.polygon(
                                  sides: 8,
                                  rotation: 22.5,
                                  squash: 0.8,
                                  pointRounding: 0.4),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  final code = _codeController.text.trim();
                                  final pin = _pinController.text.trim();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Logging in with code: $code pin:$pin')));
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()));
                                  // LoginLoading(context);
                                }
                              },
                              child: Text("Login"),
                            ),
                            // SizedBox(height: 10),
                            // GradientButton(text: "Login", onPressed: () {}),
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
