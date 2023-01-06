import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scanner_go/models/qr_scan_result.dart';

final scannedQRCodesProvider = Provider((ref) {
  return [
    QRScanResult(code: 'https://www.youtube.com/watch?v=QH2-TGUlwu4', id: '1'),
  ];
});
