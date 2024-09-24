// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:sonmit/pages/signin_page.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int selectedIndex = 0;
  final List<NavigationDestination> destinations = [
    NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
    NavigationDestination(
        icon: Icon(Icons.layers_outlined), label: "Assignment"),
    // NavigationDestination(
    //     icon: Icon(Icons.layers_outlined), label: "Assignment"),
    // NavigationDestination(
    //     icon: Icon(Icons.layers_outlined), label: "Assignment"),
  ];
  Widget trailingNavRail = Icon(Icons.abc);
  List<Widget> children = [
    Card.filled(
        child: Padding(
      padding: const EdgeInsets.all(50.0),
      child: Text('Home'),
    )),
    Card.filled(
        child: Padding(
      padding: const EdgeInsets.all(50.0),
      child: Text('Home'),
    )),
    Card.filled(
        child: Padding(
      padding: const EdgeInsets.all(50.0),
      child: Text('Home'),
    )),
    Card.filled(
        child: Padding(
      padding: const EdgeInsets.all(50.0),
      child: Text('Home'),
    )),
    Card.filled(
        child: Padding(
      padding: const EdgeInsets.all(50.0),
      child: Text('Home'),
    )),
    Card.filled(
        child: Padding(
      padding: const EdgeInsets.all(50.0),
      child: Text('Home'),
    )),
  ];

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      transitionDuration: Duration(seconds: 1),
      primaryNavigation: SlotLayout(
        config: {
          Breakpoints.medium: SlotLayout.from(
            inAnimation: AdaptiveScaffold.leftOutIn,
            key: Key("Primary Navigation Medium"),
            builder: (context) => AdaptiveScaffold.standardNavigationRail(
              selectedIndex: selectedIndex,
              onDestinationSelected: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              leading: Icon(Icons.menu),
              destinations: destinations
                  .map((destination) =>
                      AdaptiveScaffold.toRailDestination(destination))
                  .toList(),
              trailing: trailingNavRail,
            ),
          ),
          Breakpoints.mediumLarge: SlotLayout.from(
            key: Key("Primary Navigation MediumLarge"),
            inAnimation: AdaptiveScaffold.leftOutIn,
            builder: (context) => AdaptiveScaffold.standardNavigationRail(
              selectedIndex: selectedIndex,
              onDestinationSelected: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              extended: true,
              leading: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("REPLY"),
                  Icon(Icons.menu_open),
                ],
              ),
              destinations: destinations
                  .map((destination) =>
                      AdaptiveScaffold.toRailDestination(destination))
                  .toList(),
              trailing: trailingNavRail,
            ),
          ),
          Breakpoints.large: SlotLayout.from(
            key: Key("Primary Navigation Large"),
            inAnimation: AdaptiveScaffold.leftOutIn,
            builder: (context) => AdaptiveScaffold.standardNavigationRail(
              selectedIndex: selectedIndex,
              onDestinationSelected: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              extended: true,
              leading: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("REPLY"),
                  Icon(Icons.menu_open),
                ],
              ),
              destinations: destinations
                  .map((destination) =>
                      AdaptiveScaffold.toRailDestination(destination))
                  .toList(),
              trailing: trailingNavRail,
            ),
          ),
          Breakpoints.extraLarge: SlotLayout.from(
            key: Key("Primary Navigation ExtraLarge"),
            inAnimation: AdaptiveScaffold.leftOutIn,
            builder: (context) => AdaptiveScaffold.standardNavigationRail(
              selectedIndex: selectedIndex,
              onDestinationSelected: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              extended: true,
              leading: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("REPLY"),
                  Icon(Icons.menu_open),
                ],
              ),
              destinations: destinations
                  .map((destination) =>
                      AdaptiveScaffold.toRailDestination(destination))
                  .toList(),
              trailing: trailingNavRail,
            ),
          ),
        },
      ),
      body: SlotLayout(config: {
        Breakpoints.small: SlotLayout.from(
          key: Key('Body Small'),
          builder: (context) => ListView.builder(
            itemCount: children.length,
            itemBuilder: (context, index) => children[index],
          ),
        ),
        Breakpoints.medium: SlotLayout.from(
          key: Key('Body Medium'),
          builder: (context) =>
              GridView.count(crossAxisCount: 2, children: children),
        ),
        Breakpoints.mediumLarge: SlotLayout.from(
          key: Key('Body MediumLarge'),
          builder: (context) =>
              GridView.count(crossAxisCount: 3, children: children),
        ),
        Breakpoints.large: SlotLayout.from(
          key: Key('Body Large'),
          builder: (context) =>
              GridView.count(crossAxisCount: 4, children: children),
        ),
        Breakpoints.extraLarge: SlotLayout.from(
          key: Key('Body ExtraLarge'),
          builder: (context) =>
              GridView.count(crossAxisCount: 5, children: children),
        ),
      }),
      bottomNavigation: SlotLayout(config: {
        Breakpoints.small: SlotLayout.from(
          key: Key("Bottom Navigation Small"),
          inAnimation: AdaptiveScaffold.bottomToTop,
          outAnimation: AdaptiveScaffold.topToBottom,
          builder: (context) => AdaptiveScaffold.standardBottomNavigationBar(
            destinations: destinations,
            currentIndex: selectedIndex,
            onDestinationSelected: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
        ),
      }),
    );
  }
}
