import 'package:flutter/material.dart';
import 'package:scanner_go/providers/shared_preferences_service_provider.dart';
import 'package:scanner_go/resources/colors.dart';
import 'package:scanner_go/ui/pages/home/home_page.dart';
import 'package:scanner_go/resources/strings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: const ScannerApp(),
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
