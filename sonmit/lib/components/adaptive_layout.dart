// components/adaptive_layout.dart
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

class AppLayout extends StatefulWidget {
  final List<Map<String, dynamic>> destinationData;
  final bool showSecondaryBody;
  final Widget? trailingNavRail;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  bool reset;

  AppLayout({
    super.key,
    required this.destinationData,
    this.showSecondaryBody = true,
    this.trailingNavRail,
    this.scaffoldKey,
    this.reset = false,
  });

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

bool extended = false;
int selectedIndex = 0;

class _AppLayoutState extends State<AppLayout> {
  @override
  void initState() {
    selectedIndex = 0;
    widget.reset = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      if (widget.reset) {}
      ;
    });
    // Dynamically build the NavigationDestination list
    final destinations = widget.destinationData.map((data) {
      return NavigationDestination(
        icon: data['icon'] as Icon,
        label: data['label'] as String,
        selectedIcon: data['selectedIcon'] as Icon,
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
                destinations: destinations
                    .map((destination) =>
                        AdaptiveScaffold.toRailDestination(destination))
                    .toList(),
                trailing: widget.trailingNavRail,
              ),
            ),
          },
        ),

        // Main Body
        body: SlotLayout(config: {
          Breakpoints.small: SlotLayout.from(
            key: Key('Body Small'),
            builder: (context) => Padding(
                padding: EdgeInsets.all(0), child: children[selectedIndex]),
          ),
          Breakpoints.mediumAndUp: SlotLayout.from(
            key: Key('Body Medium'),
            builder: (context) => Padding(
                padding: EdgeInsets.all(0), child: children[selectedIndex]),
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

        // Bottom Navigation
        bottomNavigation: SlotLayout(config: {
          Breakpoints.small: SlotLayout.from(
              key: Key("Bottom Navigation Small"),
              inAnimation: AdaptiveScaffold.bottomToTop,
              outAnimation: AdaptiveScaffold.topToBottom,
              builder: (context) =>
                  AdaptiveScaffold.standardBottomNavigationBar(
                    destinations: destinations,
                    currentIndex: selectedIndex,
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
