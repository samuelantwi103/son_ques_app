// services/callback.dart
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sonmit/components/dialog.dart';

// Determine the color based on progress
Color getProgressColor({
  progress,
  lowProgressColor,
  mediumProgressColor,
  highProgressColor,
}) {
  if (progress <= 0.3) {
    return lowProgressColor;
  } else if (progress > 0.3 && progress <= 0.7) {
    return mediumProgressColor;
  } else {
    return highProgressColor;
  }
}


void callBottomSheet({
  required BuildContext context,
  required String title,
  String? actionText,
  bool isCompleted = false,
  required Widget content,
  bool full = true,
  required ScrollController scrollController,

  // string
}) {
  showModalBottomSheet(
    showDragHandle: true,
    enableDrag: true,
    isScrollControlled: true,
    useSafeArea: true,
    context: context,
    builder: (context) {
      return DraggableScrollableSheet(
        initialChildSize: full ? 0.9 : 0.5,
        minChildSize: full ? 0.9 : 0.3,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) {
          return CustomBottomSheet(
            title: title,
            content: content,
            full: full,
            scrollController: scrollController,
            actionText: actionText,
            onAction: () {},
          );
        },
      );
    },
  );
}

void callDialog({
  required BuildContext context,
  required Widget content,
  required String title,
  required VoidCallback onConfirm,
  bool barrierDismissible = true,
  bool showTitle = true,
  bool showCancel = true,
  bool showConfirm = true,
  Duration? timeDialog, // Optional timer duration
}) {
  showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) {
      // If a timer is specified, set a timer to close the dialog
      if (timeDialog != null) {
        Timer(timeDialog, () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
        });
      }

      return AlertDialog(
        title: showTitle ? Text(title) : null,
        content: content,
        actions: [
          if (showCancel)
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog on cancel
              },
              child: Text('Cancel'),
            ),
          if (showConfirm)
            TextButton(
              onPressed: onConfirm,
              child: Text('Confirm'),
            ),
        ],
      );
    },
  );
}