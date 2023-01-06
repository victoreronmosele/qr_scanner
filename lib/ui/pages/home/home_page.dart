import 'package:flutter/material.dart';
import 'package:scanner_go/ui/pages/home/tabs/scan_tab.dart';
import 'package:scanner_go/resources/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bottomAppBarHorizontalPadding = 40.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const ScanTab(),
          Align(
            alignment: const Alignment(0, 0.9),
            child: DefaultTabController(
              length: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: bottomAppBarHorizontalPadding),
                child: const ColoredBox(
                  color: bottomAppBarColor,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TabBar(
                      indicator: BoxDecoration(),
                      labelColor: primaryColor,
                      unselectedLabelColor: unselectedTabColor,
                      tabs: [
                        Tab(icon: Icon(Icons.qr_code_scanner)),
                        Tab(icon: Icon(Icons.history)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
