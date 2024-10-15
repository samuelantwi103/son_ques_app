// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

class AppLayout extends StatefulWidget {
  final List<Map<String, dynamic>> destinationData;
  final bool showSecondaryBody;
  final Widget? trailingNavRail;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const AppLayout({
    super.key,
    required this.destinationData,
    this.showSecondaryBody = true,
    this.trailingNavRail,
    this.scaffoldKey,
  });

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

bool extended = false;
int selectedIndex = 0;

class _AppLayoutState extends State<AppLayout> {
  @override
  Widget build(BuildContext context) {
    // Dynamically build the NavigationDestination list
    final destinations = widget.destinationData.map((data) {
      return NavigationDestination(
        icon: data['icon'] as Icon,
        label: data['label'] as String,
      );
    }).toList();

    final secondaryChildren = widget.destinationData.map(
      (data) {
        return data['secondaryPage'];
      },
    ).toList();

    final children = widget.destinationData.map(
      (data) {
        return data['page'];
      },
    ).toList();

    final smallActions = widget.destinationData.map(
      (data) {
        return IconButton(onPressed: () {}, icon: data['icon'] as Icon);
      },
    ).toList();

    final largeActions = widget.destinationData.map(
      (data) {
        return TextButton(
          onPressed: () {},
          child: Row(
            children: [
              data['icon'] as Icon,
              Text(data['label']),
            ],
          ),
        );
      },
    ).toList();

    return Scaffold(
      body: AdaptiveLayout(
        transitionDuration: Duration(milliseconds: 500),
        bodyRatio: 0.6,
        secondaryBody: !widget.showSecondaryBody || secondaryChildren.isEmpty
            ? null
            : (secondaryChildren[selectedIndex] == null)
                ? null
                : SlotLayout(config: {
                    Breakpoints.mediumAndUp: SlotLayout.from(
                      key: Key('Body Medium'),
                      builder: (context) => secondaryChildren[selectedIndex]!,
                    ),
                    Breakpoints.largeAndUp: SlotLayout.from(
                      key: Key('Body Large'),
                      builder: (context) =>
                          (secondaryChildren[selectedIndex] == null)
                              ? null
                              : secondaryChildren[selectedIndex]!,
                    ),
                    
                  }),
        primaryNavigation: SlotLayout(
          config: {
            Breakpoints.medium: SlotLayout.from(
              // outAnimation: ,
              key: Key("Primary Navigation Medium"),
              builder: (context) => AdaptiveScaffold.standardNavigationRail(
                extended: extended,
                selectedIndex: selectedIndex,
                // width: 72,

                onDestinationSelected: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                // leading: Row(
                //   mainAxisAlignment:
                //       extended ? MainAxisAlignment.end : MainAxisAlignment.center,
                //   children: [
                //     IconButton(
                //       icon: extended ? Icon(Icons.close) : Icon(Icons.menu),
                //       onPressed: () {
                //         setState(() {
                //           extended = !extended;
                //           debugPrint(extended.toString());
                //         });
                //       },
                //     ),
                //   ],
                // ),
                // groupAlignment: -1,
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
                trailing: widget.trailingNavRail,
              ),
            ),
            Breakpoints.largeAndUp: SlotLayout.from(
              key: Key("Primary Navigation Large"),
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
                //     Text("SONMIT"),
                //     // Icon(Icons.menu_open),
                //   ],
                // ),
                destinations: destinations
                    .map((destination) =>
                        AdaptiveScaffold.toRailDestination(destination))
                    .toList(),
                trailing: widget.trailingNavRail,
              ),
            ),
            // Breakpoints.extraLarge: SlotLayout.from(
            //   key: Key("Primary Navigation ExtraLarge"),
            //   builder: (context) => AdaptiveScaffold.standardNavigationRail(
            //     selectedIndex: widget.selectedIndex,
            //     onDestinationSelected: (index) {
            //       setState(() {
            //         widget.selectedIndex = index;
            //       });
            //     },
            //     extended: true,
            //     // leading: Row(
            //     //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     //   children: [
            //     //     Text("REPLY"),
            //     //     Icon(Icons.menu_open),
            //     //   ],
            //     // ),
            //     destinations: destinations
            //         .map((destination) =>
            //             AdaptiveScaffold.toRailDestination(destination))
            //         .toList(),
            //     // trailing: widget.trailingNavRail,
            //   ),
            // ),
          },
        ),
        body: SlotLayout(config: {
          Breakpoints.small: SlotLayout.from(
            key: Key('Body Small'),
            builder: (context) => children[selectedIndex],
          ),
          Breakpoints.mediumAndUp: SlotLayout.from(
            key: Key('Body Medium'),
            builder: (context) => children[selectedIndex],
          ),
          // Breakpoints.mediumLarge: SlotLayout.from(
          //   key: Key('Body MediumLarge'),
          //   builder: (context) =>  ListView(children: widget.children),
          // ),
          Breakpoints.largeAndUp: SlotLayout.from(
            key: Key('Body Large'),
            builder: (context) => children[selectedIndex],
          ),
          // Breakpoints.extraLarge: SlotLayout.from(
          //   key: Key('Body ExtraLarge'),
          //   builder: (context) =>  ListView(children: widget.children),
          // ),
        }),
        bottomNavigation: SlotLayout(config: {
          Breakpoints.small: SlotLayout.from(
              key: Key("Bottom Navigation Small"),
              inAnimation: AdaptiveScaffold.bottomToTop,
              outAnimation: AdaptiveScaffold.topToBottom,
              builder: (context) => NavigationBar(
                    destinations: destinations,
                    selectedIndex: selectedIndex,
                    onDestinationSelected: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  )
              // AdaptiveScaffold.standardBottomNavigationBar(
              //   destinations: destinations,
              //   currentIndex: widget.selectedIndex,
              //   onDestinationSelected: (index) {
              //     setState(() {
              //       widget.selectedIndex = index;
              //     });
              //   },
              // ),
              ),
        }),
      ),
    );
  }
}
