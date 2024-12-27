// components/custom_scaffold.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

class CustomScaffold extends StatefulWidget {
  List<Widget> children;
  final EdgeInsets? padding;
  CustomScaffold({
    super.key,
    required this.children, this.padding,
  });

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) {
    return Breakpoints.mediumAndUp.isActive(context)
        ? Row(
          
            children: widget.children,
          )
        : Column(
          mainAxisSize: MainAxisSize.max,
            children: widget.children,
          );
  }
}
