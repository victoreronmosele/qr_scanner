import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scanner_go/providers/scanned_qr_codes_provider.dart';
import 'package:scanner_go/resources/colors.dart';
import 'package:scanner_go/resources/strings.dart';

class HistoryTab extends ConsumerWidget {
  const HistoryTab({super.key});

  final listViewTopPadding = 16.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scannedQRCodes = ref.watch(scannedQRCodesProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: darkBackgroundColor,
      appBar: AppBar(
        title: const Text(
          historyTabTitle,
        ),
        backgroundColor: elevatedWidgetBackgroundColor,
        centerTitle: true,
      ),
      body: scannedQRCodes.isEmpty
          ? const Center(
              child: Text(
                noQrCodesScannedYet,
              ),
            )
          : Padding(
              padding: EdgeInsets.only(top: listViewTopPadding),
              child: ListView.builder(
                itemCount: scannedQRCodes.length,
                itemBuilder: (context, index) {
                  final scannedQRCode = scannedQRCodes[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: ListTile(
                      title: Text(
                        scannedQRCode.code ?? noResultFound,
                        style: Theme.of(context).textTheme.button,
                        textAlign: TextAlign.start,
                      ),
                      tileColor: elevatedWidgetBackgroundColor,
                    ),
                  );
                },
              ),
            ),
    );
  }
}
