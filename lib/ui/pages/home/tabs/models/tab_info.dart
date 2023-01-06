import 'package:flutter/material.dart';

/// Holds information about a tab.
class TabInfo {
  /// The title of the tab to be displayed in the bottom app bar and in the
  /// app bar (if needed)
  final String title;

  /// The icon to display in the bottom app bar for the tab.
  final IconData icon;

  /// The page holding the content of the tab.
  final Widget page;

  TabInfo({
    required this.title,
    required this.icon,
    required this.page,
  });
}
