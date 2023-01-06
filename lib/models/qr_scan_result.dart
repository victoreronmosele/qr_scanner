/// This class is used to store the result of a QR scan.
///
/// The [code] is the string-content of the barcode.
/// The [id] is the id of the scanned QR code. It should be unique.
class QRScanResult {
  QRScanResult({required this.code, required this.id});

  final String code;
  final String id;

  @override
  String toString() {
    return 'QRScanResult{code: $code, id: $id}';
  }
}
