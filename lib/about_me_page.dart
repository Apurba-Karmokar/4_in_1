import 'package:flutter/material.dart';
import 'portfolioapp.dart';

class AboutMePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Assuming the theme toggle function and isDarkMode state are managed at the app level
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final ValueChanged<bool> onThemeChanged = (bool value) {
      // Logic to toggle theme at app level
    };

    return ProfilePage(
      onThemeChanged: onThemeChanged,
      isDarkMode: isDarkMode,
    );
  }
}
