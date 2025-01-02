// components/button.dart
import 'package:flutter/material.dart';

// ROUNDED Button
class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const RoundedButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: Colors.grey[300],
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      ),
      child: Text(text, style: const TextStyle(color: Colors.black)),
    );
  }
}

// OUTLINED Button
class OutlinedCustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const OutlinedCustomButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          // elevation: WidgetStatePropertyAll(10),
          padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 15)),
          side: WidgetStatePropertyAll(BorderSide(
            width: 2,
            color: Theme.of(context).colorScheme.primary,
          ))),
      child: Text(text),
    );
  }
}

//Full Button
class FullButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool enabled;

  const FullButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        // maxWidth: 300,
      ),
      child: MaterialButton(
        onPressed: enabled ? onPressed : null,
        enableFeedback: enabled,
        disabledColor:
            Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5),

        color: Theme.of(context)
            .colorScheme
            .primaryContainer
            .withOpacity(enabled ? 1 : 0.4),

        textColor: Theme.of(context).colorScheme.onPrimary,
        minWidth: double.maxFinite,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.transparent)),
        // style: ButtonStyle(
        //     // elevation: WidgetStatePropertyAll(10),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        //     side: WidgetStatePropertyAll(BorderSide(
        //       width: 2,
        //     ))),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 15,
                letterSpacing: 5,
              ),
        ),
      ),
    );
  }
}

//Full Button
class FullOutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool enabled;

  const FullOutlineButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        // maxWidth: 300,
      ),
      child: MaterialButton(
        onPressed: enabled ? onPressed : null,
        // disabledColor:
        //     Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5),

        // color: Theme.of(context).colorScheme.primary,
        textColor: Theme.of(context).colorScheme.primary,
        minWidth: double.maxFinite,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context)
                .colorScheme
                .primaryContainer
                .withOpacity(enabled ? 1 : 0.5),
            width: 3,
          ),
        ),
        // style: ButtonStyle(
        //     // elevation: WidgetStatePropertyAll(10),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        //     side: WidgetStatePropertyAll(BorderSide(
        //       width: 2,
        //     ))),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context)
                    .colorScheme
                    .primaryContainer
                    .withOpacity(enabled ? 1 : 0.5),
                fontSize: 15,
                letterSpacing: 5,
              ),
        ),
      ),
    );
  }
}

// I'M BLACK Button
class BlackButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const BlackButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}

// REFLEX Button
class ReflexButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ReflexButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[700],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}

// RAISED Button
class RaisedCustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const RaisedCustomButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      ),
      child: Text(text),
    );
  }
}

// SMOOTH Button
class SmoothButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final double? elevation;

  const SmoothButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color, this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        
        elevation: elevation,
        backgroundColor:
            color ?? Theme.of(context).colorScheme.primaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      ),
      child: Text(
        text,
        style:
            TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer),
      ),
    );
  }
}

// GRADIENT Button
class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const GradientButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 240, 208, 188),
            Color.fromARGB(255, 247, 120, 52)
          ],
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(text, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}

// DASHED Button
class DashedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const DashedButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: Colors.grey[700]!,
          width: 2,
          style: BorderStyle.solid,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      ),
      child: Text(text, style: const TextStyle(color: Colors.grey)),
    );
  }
}

// Icon Button
class IconDeleteButton extends StatelessWidget {
  final VoidCallback onPressed;

  const IconDeleteButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.delete, color: Colors.white),
      label: const Text("DELETE"),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      ),
    );
  }
}

// Icon Circle Button
class IconCircleButton extends StatelessWidget {
  final VoidCallback onPressed;

  const IconCircleButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.all(20),
      ),
      child: const Icon(Icons.add, color: Colors.white),
    );
  }
}
