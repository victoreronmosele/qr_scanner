import 'package:shared_preferences/shared_preferences.dart';

/// This class is used to save and get the saved QR codes from the shared preferences.
class SharedPreferencesService {
  /// The key for the saved QR codes.
  final qrCodesKey = 'qrCodes';

  SharedPreferencesService({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  /// Saves the QR code to the shared preferences.
  Future<bool> saveQRCode({required String encodedJson}) async {
    final List<String> savedQRCodes =
        sharedPreferences.getStringList(qrCodesKey) ?? [];

    return sharedPreferences
        .setStringList(qrCodesKey, [encodedJson, ...savedQRCodes]);
  }

  /// Gets the saved QR codes from the shared preferences.
  List<String> getSavedQRCodes() {
    final List<String> savedQRCodes =
        sharedPreferences.getStringList(qrCodesKey) ?? [];

    return savedQRCodes;
  }
}
