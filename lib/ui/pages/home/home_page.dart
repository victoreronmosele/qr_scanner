import 'package:flutter/material.dart';
import 'package:scanner_go/ui/pages/home/tabs/scan_tab.dart';
import 'package:scanner_go/ui/widgets/bottom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const ScanTab(),
          Align(
            alignment: const Alignment(0, 0.9),
            child: ScannerGoBottomAppBar(
              tabs: const [
                Tab(icon: Icon(Icons.qr_code_scanner)),
                Tab(icon: Icon(Icons.history)),
              ],
              onTabChange: (selectedTab) {},
            ),
          ),
        ],
      ),
    );
  }
}
