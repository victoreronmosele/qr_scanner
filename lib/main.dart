import 'package:flutter/material.dart';
import 'package:scanner_go/resources/colors.dart';
import 'package:scanner_go/ui/pages/home/home_page.dart';
import 'package:scanner_go/resources/strings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: ScannerApp(),
    ),
  );
}

class ScannerApp extends StatelessWidget {
  const ScannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData.dark()
        ..copyWith(
          primaryColor: primaryColor,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: accentColor),
        ),
      home: const HomePage(),
    );
  }
}
