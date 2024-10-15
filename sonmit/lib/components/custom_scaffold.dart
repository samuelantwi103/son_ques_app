// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomScaffold extends StatefulWidget {
  List<Widget> body;
  Color? backgroundColor;
  bool jumbo;
  CustomScaffold(
      {super.key,
      required this.body,
      this.backgroundColor,
      this.jumbo = false});

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) {
    // Color backgroundColor;
    widget.backgroundColor == null
        ? widget.backgroundColor = Theme.of(context).colorScheme.surface
        : null;
    return Container(
        width: MediaQuery.of(context).size.width,
        color: widget.backgroundColor,
        constraints: widget.jumbo
            ? BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height - 60,
                minHeight: MediaQuery.of(context).size.height - 60,
              ):null,
            // : BoxConstraints(
            //     minHeight: MediaQuery.of(context).size.height - 80),
        // height: MediaQuery.of(context).size.height - 80,
        child: SingleChildScrollView(
          child: Column(
            children: widget.body,
          ),
        )
        );
  }
}
