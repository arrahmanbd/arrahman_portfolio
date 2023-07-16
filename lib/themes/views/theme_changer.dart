import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../all_imports.dart';
import '../controller/theme_controller.dart';

class ThemeChanger extends ConsumerWidget {
  const ThemeChanger({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return InkWell(
      onTap: () {
        ref.read(themeProvider).changeTheme();
      },
      child:  theme.isDark?const FaIcon(
        FontAwesomeIcons.lightbulb,
        size: 18,
        color: Color(0xff1C8302),
      ):const FaIcon(
        FontAwesomeIcons.solidLightbulb,
        size: 18,
        color: Color(0xff1C8302),
      ),
    );
  }
}
