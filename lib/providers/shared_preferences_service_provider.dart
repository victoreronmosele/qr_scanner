import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scanner_go/services/shared_preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>(
  (ref) {
    /// It will be overriden in the main.dart
    ///
    /// This is done so that the instance of the [SharedPreferences] object
    /// is created only once and is available to all the providers and we can
    /// synchronously access it.
    throw UnimplementedError();
  },
);

final sharedPreferencesServiceProvider =
    Provider<SharedPreferencesService>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  return SharedPreferencesService(sharedPreferences: sharedPreferences);
});
