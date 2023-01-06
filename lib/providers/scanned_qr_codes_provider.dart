import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scanner_go/models/qr_scan_result.dart';
import 'package:scanner_go/providers/shared_preferences_service_provider.dart';
import 'package:scanner_go/services/shared_preferences_service.dart';

final scannedQRCodesProvider =
    StateNotifierProvider<QRScanResultNotifier, List<QRScanResult>>((ref) {
  final sharedPreferencesService = ref.watch(sharedPreferencesServiceProvider);
  return QRScanResultNotifier(
    sharedPreferencesService: sharedPreferencesService,
  );
});

class QRScanResultNotifier extends StateNotifier<List<QRScanResult>> {
  QRScanResultNotifier({
    required this.sharedPreferencesService,
  }) : super(sharedPreferencesService
            .getSavedQRCodes()
            .map((e) => QRScanResult.fromJsonString(e))
            .toList());

  final SharedPreferencesService sharedPreferencesService;

  void _saveQRScanResultToSharedPreferences(QRScanResult qrScanResult) {
    sharedPreferencesService.saveQRCode(
      encodedJson: qrScanResult.toJsonString(),
    );
  }

  void saveQRCode(QRScanResult qrScanResult) {
    state = [qrScanResult, ...state];
    _saveQRScanResultToSharedPreferences(qrScanResult);
  }
}
