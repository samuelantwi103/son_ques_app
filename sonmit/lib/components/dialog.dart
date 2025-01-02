// components/dialog.dart
import 'package:flutter/material.dart';
import 'package:sonmit/components/button.dart';
import 'package:sonmit/components/card.dart';

class PopupDialog extends StatelessWidget {
  final String title;
  final Widget message;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;
  final bool showTitle;
  final bool showCancel;
  final bool showConfirm;

  const PopupDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onCancel,
    required this.onConfirm,
    required this.showTitle,
    required this.showCancel,
    required this.showConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: showTitle ? Text(title) : null,
      content: message,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      buttonPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
      actions: !showCancel && !showConfirm
          ? null
          : <Widget>[
              showCancel
                  ? ElevatedCard(
                      padding: EdgeInsets.all(0),
                      child: TextButton(
                        onPressed: onCancel,
                        child: Text('Cancel'),
                      ),
                    )
                  : SizedBox(),
              showConfirm
                  ? ElevatedCard(
                      // clipper: OctagonClipper(),
                      // padding: EdgeInsets.symmetric(horizontal: 16),
                      // borderRadius: BorderRadius.circular(10),

                      color: Theme.of(context).colorScheme.primaryContainer,
                      // shadowColorLow: Color(0xFFF1A873),
                      // shadowColorHigh: Color(0xFF984001),
                      padding: EdgeInsets.all(0),
                      child: TextButton(
                        // elevation: 0,
                        // color: Theme.of(context).colorScheme.primaryContainer,
                        style: ButtonStyle(
                            foregroundColor: WidgetStatePropertyAll(
                                Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer)),
                        onPressed: onConfirm,
                        child: Text('Confirm'),
                      ),
                    )
                  : SizedBox(),
            ],
    );
  }
}

class CustomBottomSheet extends StatefulWidget {
  final String title;
  final Widget content;
  final String? actionText;
  final VoidCallback? onAction;
  final ScrollController scrollController;
  final bool full;

  const CustomBottomSheet({
    super.key,
    required this.title,
    required this.content,
    required this.actionText,
    required this.onAction,
    required this.scrollController,
    required this.full,
  });

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    if (widget.actionText != null) {
      return Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            widget.content,
            SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: widget.onAction,
                child: Text(widget.actionText!),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Expanded(child: widget.content),
            SizedBox(height: 20),
          ],
        ),
      );
    }
  }
}
