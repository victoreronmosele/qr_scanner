import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:scanner_go/resources/colors.dart';
import 'package:scanner_go/resources/strings.dart';

class ScanTab extends StatefulWidget {
  const ScanTab({
    Key? key,
  }) : super(key: key);

  @override
  State<ScanTab> createState() => _ScanTabState();
}

class _ScanTabState extends State<ScanTab> {
  QRViewController? controller;

  /// This is needed for development purposes only.
  ///
  /// In order to get hot reload to work we need to pause the camera if the platform
  /// is android, or resume the camera if the platform is iOS.
  ///
  /// Source: https://pub.dev/documentation/qr_code_scanner/latest/#:~:text=//%20In%20order%20to%20get%20hot%20reload%20to%20work%20we%20need%20to%20pause%20the%20camera%20if%20the%20platform%0A%20%20//%20is%20android%2C%20or%20resume%20the%20camera%20if%20the%20platform%20is%20iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    }
    controller?.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(appTitle),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: QRView(
          key: GlobalKey(debugLabel: 'QR'),
          onQRViewCreated: (controller) {
            this.controller = controller;

            /// Resume camera if it was paused by leaving the screen or by
            /// some other means
            controller.resumeCamera();
            controller.scannedDataStream.listen((scanData) {});
          },
          onPermissionSet: (controller, hasPermissions) {},
          overlay: QrScannerOverlayShape(
            borderColor: qrBorderColor,
            borderRadius: 10,
            borderLength: 30,
            borderWidth: 10,
          ),
          formatsAllowed: const [
            BarcodeFormat.qrcode,
          ],

        ),
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
