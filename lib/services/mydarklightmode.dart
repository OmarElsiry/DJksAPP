import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';

class MyDarkLightModeButton extends StatelessWidget {
  const MyDarkLightModeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DayNightSwitcherIcon(
      isDarkModeEnabled: Get.isDarkMode,
      onStateChanged: (isDarkModeEnabled) {
        Get.changeThemeMode(
            isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light);
      },
    );
  }
}
