import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scanner_go/models/qr_scan_result.dart';

final scannedQRCodesProvider = Provider<List<QRScanResult>>((ref) {
  return [];
});
