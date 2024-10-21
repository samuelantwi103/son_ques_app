import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sonmit/themes/theme_provider.dart';

class ThemeSwitch extends ConsumerStatefulWidget {
  const ThemeSwitch({super.key});

  @override
  ConsumerState<ThemeSwitch> createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends ConsumerState<ThemeSwitch> {
  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeNotifierProvider);
    return Switch.adaptive(
      value: themeMode == ThemeMode.dark,
      thumbIcon: WidgetStatePropertyAll(
        Icon(
          themeMode == ThemeMode.dark
              ? Icons.dark_mode_outlined
              : Icons.light_mode_outlined,
              color:themeMode == ThemeMode.dark
              ? Theme.of(context).colorScheme.secondary:null,
        ),
      ),
      onChanged: (value) {
        ref.read(themeNotifierProvider.notifier).toggleTheme();
      },
    );
  }
}
