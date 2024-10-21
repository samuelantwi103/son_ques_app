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
}) {
  showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) {
      return PopupDialog(
          title: title,
          message: content,
          onConfirm: onConfirm,
          showTitle: showTitle,
          showCancel: showCancel,
          onCancel: () {
            Navigator.pop(context);
          });
    },
  );
}
