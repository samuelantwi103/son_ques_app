// signin_page.dart
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 80,
      //   backgroundColor: Theme.of(context).primaryColor,
      //   title: Text("SON Questions App"),
      //   centerTitle: true,
      //   leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu_rounded))
      //   ),
      body: ListView(children: [
        SizedBox(
          width: 200,
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Text(
                "Login",
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
              ),
              Text("Hello"),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.inversePrimary,
            borderRadius: BorderRadius.only(
              // topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
        )
      ]),
    );
  }
}
