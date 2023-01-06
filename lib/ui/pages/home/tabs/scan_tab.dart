import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:scanner_go/models/qr_scan_result.dart';
import 'package:scanner_go/providers/scanned_qr_codes_provider.dart';
import 'package:scanner_go/resources/colors.dart';
import 'package:scanner_go/resources/strings.dart';

class ScanTab extends ConsumerStatefulWidget {
  const ScanTab({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _ScanTabState();
}

class _ScanTabState extends ConsumerState<ScanTab> {
  /// Controller for the QR scanner.
  QRViewController? controller;

  /// The result of the barcode scan.
  Barcode? scannedBarcodeResult;

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
        child: Stack(
          children: [
            scannedBarcodeResult != null
                ? Container(
                    color: darkBackgroundColor,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            scannedBarcodeResult!.code ?? noResultFound,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                scannedBarcodeResult = null;
                              });

                              /// Resume the camera when the user wants to scan
                              /// another barcode.
                              controller?.resumeCamera();
                            },
                            child: const Text(scanAnotherBarCode),
                          ),
                        ],
                      ),
                    ),
                  )
                : QRView(
                    key: GlobalKey(debugLabel: 'QR'),
                    onQRViewCreated: (controller) async {
                      /// Store the controller so we can pause/resume the camera.
                      this.controller = controller;

                      /// Resume camera if it was paused by leaving the screen or by
                      /// some other means
                      controller.resumeCamera();

                      controller.scannedDataStream.listen((scanData) {
                        final scannedQRCode = QRScanResult(
                          code: scanData.code,
                          timeOfScan: DateTime.now(),
                        );

                        ref
                            .read(scannedQRCodesProvider.notifier)
                            .saveQRCode(scannedQRCode);

                        setState(() {
                          scannedBarcodeResult = scanData;
                        });

                        /// Pause the camera when a barcode is scanned.
                        controller.pauseCamera();
                      });
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
