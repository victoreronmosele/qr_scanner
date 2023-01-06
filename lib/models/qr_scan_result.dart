import 'dart:convert';

import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

/// This class is used to store the result of a QR scan.
///
/// The [code] is the string-content of the barcode.
/// The [id] is the id of the scanned QR code. It should be unique.
/// The [timeOfScan] is the time when the QR code was scanned.
class QRScanResult {
  /// Sets the [id] of the scanned QR code to a unique value.
  QRScanResult({required this.code, required this.timeOfScan})
      : id = const Uuid().v1();

  final String? code;
  final String id;
  final DateTime timeOfScan;

  @override
  String toString() {
    return 'QRScanResult{code: $code, id: $id}';
  }

  /// Creates a [QRScanResult] from a JSON string.
  QRScanResult.fromJsonString(String jsonString)
      : this._fromJson(json.decode(jsonString));

  /// Creates a [QRScanResult] from a JSON map.
  QRScanResult._fromJson(Map<String, dynamic> jsonMap)
      : code = jsonMap['code'],
        id = jsonMap['id'],
        timeOfScan = DateTime.parse(jsonMap['timeOfScan']);

  /// Converts the [QRScanResult] to a JSON string.
  String toJsonString() => json.encode({
        'code': code,
        'id': id,
        'timeOfScan': timeOfScan.toIso8601String(),
      });
}

/// Extends the [DateTime] class with a method to format the date and time.
extension HumanReadableDateTime on DateTime {
  String toHumanReadableFormat() {
    return DateFormat.yMEd().add_jms().format(this);
  }
}
