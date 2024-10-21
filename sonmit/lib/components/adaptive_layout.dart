import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

class CustomBreakpoint extends Breakpoint {
  const CustomBreakpoint({
    super.beginWidth,
    super.endWidth,
    super.beginHeight,
    super.endHeight,
    super.andUp = false,
    super.platform,
    super.spacing = kMaterialMediumAndUpSpacing,
    super.recommendedPanes = 1,
    super.maxPanes = 1,
  }) : super(padding:100, margin: 0); // Set padding to 0

  // Correct factory constructors
  factory CustomBreakpoint.standard({Set<TargetPlatform>? platform}) {
    return CustomBreakpoint(
      beginWidth: -1,
      endWidth: null,
      beginHeight: null,
      endHeight: null,
      spacing: kMaterialMediumAndUpSpacing,
      recommendedPanes: 1,
      maxPanes: 1,
      andUp: true,
      platform: platform,
    );
  }

  factory CustomBreakpoint.small({bool andUp = false, Set<TargetPlatform>? platform}) {
    return CustomBreakpoint(
      beginWidth: 0,
      endWidth: 600,
      beginHeight: null,
      endHeight: 480,
      spacing: kMaterialCompactSpacing,
      recommendedPanes: 1,
      maxPanes: 1,
      andUp: andUp,
      platform: platform,
    );
  }

  factory CustomBreakpoint.medium({bool andUp = false, Set<TargetPlatform>? platform}) {
    return CustomBreakpoint(
      beginWidth: 600,
      endWidth: 840,
      beginHeight: 480,
      endHeight: 900,
      spacing: kMaterialMediumAndUpSpacing,
      recommendedPanes: 1,
      maxPanes: 2,
      andUp: andUp,
      platform: platform,
    );
  }

  factory CustomBreakpoint.mediumLarge({bool andUp = false, Set<TargetPlatform>? platform}) {
    return CustomBreakpoint(
      beginWidth: 840,
      endWidth: 1200,
      beginHeight: 900,
      endHeight: null,
      spacing: kMaterialMediumAndUpSpacing,
      recommendedPanes: 2,
      maxPanes: 2,
      andUp: andUp,
      platform: platform,
    );
  }

  factory CustomBreakpoint.large({bool andUp = false, Set<TargetPlatform>? platform}) {
    return CustomBreakpoint(
      beginWidth: 1200,
      endWidth: 1600,
      beginHeight: 900,
      endHeight: null,
      spacing: kMaterialMediumAndUpSpacing,
      recommendedPanes: 2,
      maxPanes: 2,
      andUp: andUp,
      platform: platform,
    );
  }

  factory CustomBreakpoint.extraLarge({bool andUp = false, Set<TargetPlatform>? platform}) {
    return CustomBreakpoint(
      beginWidth: 1600,
      endWidth: null,
      beginHeight: 900,
      endHeight: null,
      spacing: kMaterialMediumAndUpSpacing,
      recommendedPanes: 2,
      maxPanes: 3,
      andUp: andUp,
      platform: platform,
    );
  }
}

// Usage example:
class CustomBreakpoints extends Breakpoint {
  static const CustomBreakpoint small = CustomBreakpoint(
    beginWidth: 0,
    endWidth: 600,
    beginHeight: null,
    endHeight: 480,
    spacing: kMaterialCompactSpacing,
    recommendedPanes: 1,
    maxPanes: 1,
  );

  static const CustomBreakpoint medium = CustomBreakpoint(
    beginWidth: 600,
    endWidth: 840,
    beginHeight: 480,
    endHeight: 900,
    spacing: kMaterialMediumAndUpSpacing,
    recommendedPanes: 1,
    maxPanes: 2,
  );

  // Add other breakpoints similarly...
}


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
          
          CustomBreakpoints.small: SlotLayout.from(

            key: Key('Body Small'),
            builder: (context) => Padding(
              padding: EdgeInsets.all(0),
              child: children[selectedIndex]),
          ),
          Breakpoints.mediumAndUp: SlotLayout.from(
            key: Key('Body Medium'),
            builder: (context) =>  Padding(
              padding: EdgeInsets.all(0),
              child: children[selectedIndex]),
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
              builder: (context) => AdaptiveScaffold.standardBottomNavigationBar(
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
