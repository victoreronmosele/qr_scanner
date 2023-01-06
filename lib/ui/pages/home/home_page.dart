import 'package:flutter/material.dart';
import 'package:scanner_go/resources/strings.dart';
import 'package:scanner_go/ui/pages/home/tabs/history_tab.dart';
import 'package:scanner_go/ui/pages/home/tabs/models/tab_info.dart';
import 'package:scanner_go/ui/pages/home/tabs/scan_tab.dart';
import 'package:scanner_go/ui/pages/home/widgets/bottom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// Holds a list of all the tabs.
  final tabs = [
    TabInfo(
      title: scanTabTitle,
      icon: Icons.qr_code_scanner,
      page: const ScanTab(),
    ),
    TabInfo(
      title: historyTabTitle,
      icon: Icons.history,
      page: const HistoryTab(),
    ),
  ];

  /// The index of the currently selected tab.
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          tabs[_currentIndex].page,
          Align(
            alignment: const Alignment(0, 0.9),
            child: ScannerGoBottomAppBar(
              tabs: tabs,
              onTabChange: (selectedTabIndex) {
                setState(() {
                  _currentIndex = selectedTabIndex;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
