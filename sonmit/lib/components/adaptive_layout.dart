// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

class AppLayout extends StatefulWidget {
  final List<Map<String, dynamic>> destinationData;
  final List<Widget> children;
  final List<Widget> secondaryChildren;
  final bool showSecondaryBody;
  final Widget trailingNavRail;

  const AppLayout({
    Key? key,
    required this.destinationData,
    required this.children,
    required this.secondaryChildren,
    this.showSecondaryBody = true,
    this.trailingNavRail = const Icon(Icons.abc),
  }) : super(key: key);

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Dynamically build the NavigationDestination list
    final destinations = widget.destinationData.map((data) {
      return NavigationDestination(
        icon: data['icon'] as Icon,
        label: data['label'] as String,
      );
    }).toList();

    return AdaptiveLayout(
      transitionDuration: Duration(milliseconds: 500),
      secondaryBody: !widget.showSecondaryBody
          ? null
          : SlotLayout(config: {
              Breakpoints.medium: SlotLayout.from(
                key: Key('Body Medium'),
                builder: (context) => GridView.count(
                  crossAxisCount: 2,
                  children: widget.secondaryChildren,
                ),
              ),
              Breakpoints.mediumLarge: SlotLayout.from(
                key: Key('Body MediumLarge'),
                builder: (context) => GridView.count(
                  crossAxisCount: 3,
                  children: widget.secondaryChildren,
                ),
              ),
              Breakpoints.large: SlotLayout.from(
                key: Key('Body Large'),
                builder: (context) => GridView.count(
                  crossAxisCount: 4,
                  children: widget.secondaryChildren,
                ),
              ),
              Breakpoints.extraLarge: SlotLayout.from(
                key: Key('Body ExtraLarge'),
                builder: (context) => GridView.count(
                  crossAxisCount: 5,
                  children: widget.secondaryChildren,
                ),
              ),
            }),
      primaryNavigation: SlotLayout(
        config: {
          Breakpoints.medium: SlotLayout.from(
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
              trailing: widget.trailingNavRail,
            ),
          ),
          Breakpoints.mediumLarge: SlotLayout.from(
            key: Key("Primary Navigation MediumLarge"),
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
              trailing: widget.trailingNavRail,
            ),
          ),
          Breakpoints.large: SlotLayout.from(
            key: Key("Primary Navigation Large"),
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
              trailing: widget.trailingNavRail,
            ),
          ),
          Breakpoints.extraLarge: SlotLayout.from(
            key: Key("Primary Navigation ExtraLarge"),
            builder: (context) => AdaptiveScaffold.standardNavigationRail(
              selectedIndex: selectedIndex,
              onDestinationSelected: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              extended: true,
              // leading: Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     Text("REPLY"),
              //     Icon(Icons.menu_open),
              //   ],
              // ),
              destinations: destinations
                  .map((destination) =>
                      AdaptiveScaffold.toRailDestination(destination))
                  .toList(),
              // trailing: widget.trailingNavRail,
            ),
          ),
        },
      ),
      body: SlotLayout(config: {
        Breakpoints.small: SlotLayout.from(
          key: Key('Body Small'),
          builder: (context) => ListView.builder(
            itemCount: widget.children.length,
            itemBuilder: (context, index) => widget.children[index],
          ),
        ),
        Breakpoints.medium: SlotLayout.from(
          key: Key('Body Medium'),
          builder: (context) => GridView.count(
            crossAxisCount: 2,
            children: widget.children,
          ),
        ),
        Breakpoints.mediumLarge: SlotLayout.from(
          key: Key('Body MediumLarge'),
          builder: (context) => GridView.count(
            crossAxisCount: 3,
            children: widget.children,
          ),
        ),
        Breakpoints.large: SlotLayout.from(
          key: Key('Body Large'),
          builder: (context) => GridView.count(
            crossAxisCount: 4,
            children: widget.children,
          ),
        ),
        Breakpoints.extraLarge: SlotLayout.from(
          key: Key('Body ExtraLarge'),
          builder: (context) => GridView.count(
            crossAxisCount: 5,
            children: widget.children,
          ),
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
