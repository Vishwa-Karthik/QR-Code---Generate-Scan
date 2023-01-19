import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../Widgets/tool.dart';

class QrResultPage extends StatelessWidget {
  const QrResultPage({
    super.key,
    required this.qrResult,
    required this.closeScreen,
  });

  final String qrResult;
  final Function()? closeScreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //* app bar
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            closeScreen!();
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: Text(
          "Your Result",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),

      //* body
      body: Container(
        padding: const EdgeInsets.all(12),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //* show QR image
            QrImage(
              data: qrResult,
              size: 200,
              version: QrVersions.auto,
            ),
            const SizedBox(
              height: 20,
            ),

            //* Result
            Text(
              "Scanned QR Code:",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline2,
            ),

            const SizedBox(
              height: 10,
            ),

            Text(
              qrResult,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline2,
            ),

            const SizedBox(
              height: 20,
            ),

            //* tools
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //* copy
                MyTool(
                  icon: const Icon(Icons.copy),
                  text: "Copy",
                  onPressed: () {
                    HapticFeedback.heavyImpact();
                    Clipboard.setData(
                      ClipboardData(text: qrResult),
                    );
                  },
                ),

                //* share
                MyTool(
                  icon: const Icon(Icons.share),
                  text: "Share",
                  onPressed: () {
                    HapticFeedback.heavyImpact();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
