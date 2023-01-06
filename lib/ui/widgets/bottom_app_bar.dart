import 'package:flutter/material.dart';
import 'package:scanner_go/resources/colors.dart';

/// Holds the bottom app bar for the home page.
///
class ScannerGoBottomAppBar extends StatelessWidget {
  const ScannerGoBottomAppBar(
      {super.key, required this.onTabChange, required this.tabs});

  /// Called when the user taps on a tab.
  ///
  /// The index of the tab is passed as an argument.
  final void Function(int) onTabChange;

  final List<Tab> tabs;

  final bottomAppBarHorizontalPadding = 40.0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: bottomAppBarHorizontalPadding),
        child: ColoredBox(
          color: bottomAppBarColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TabBar(
              indicator: const BoxDecoration(),
              labelColor: primaryColor,
              unselectedLabelColor: unselectedTabColor,
              tabs: tabs,
            ),
          ),
        ),
      ),
    );
  }
}
