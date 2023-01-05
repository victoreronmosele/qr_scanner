import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: QRView(
              key: GlobalKey(debugLabel: 'QR'),
              onQRViewCreated: (controller) {
                controller.scannedDataStream.listen((scanData) {});
              },
              onPermissionSet: (controller, hasPermissions) {},
              overlay: QrScannerOverlayShape(
                borderColor: Colors.red,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
              ))),
    );
  }
}
