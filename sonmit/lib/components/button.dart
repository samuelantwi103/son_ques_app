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

  const SmoothButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.amber[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      ),
      child: Text(text, style: const TextStyle(color: Colors.black)),
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
