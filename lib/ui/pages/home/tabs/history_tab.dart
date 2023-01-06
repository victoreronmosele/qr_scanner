import 'package:flutter/material.dart';
import 'package:scanner_go/resources/colors.dart';
import 'package:scanner_go/resources/strings.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: historyTabBackgroundColor,
      appBar: AppBar(
        title: const Text(
          historyTabTitle,
        ),
        backgroundColor: historyTabBackgroundColor,
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'History',
          style: TextStyle(
            color: Colors.white70,
          ),
        ),
      ),
    );
  }
}
