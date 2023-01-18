import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_code/Screens/qr_screen_result.dart';
import 'package:qr_code/Widgets/tool.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //* qr scan transaction
  bool isScanComplete = false;

  //* change page
  void closeScanner() {
    setState(() {
      isScanComplete = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //* app bar
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: Text(
          'QR Scanner',
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,
      ),

      //* body
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            //* Body title
            Expanded(
              child: Column(
                children: [
                  Text(
                    "Place your QR code here",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    "Scanned Automatically",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),

            //* Camera Container
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  //* mobile view
                  MobileScanner(
                    allowDuplicates: true,
                    onDetect: (barcode, args) {
                      if (!isScanComplete) {
                        String qrResult = barcode.rawValue ?? "---";
                        setState(() {
                          isScanComplete = true;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QrResultPage(
                              closeScreen: closeScanner,
                              qrResult: qrResult,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),

            //* Tools Container
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyTool(
                  onPressed: () {},
                  text: "Flash",
                  icon: const Icon(
                    Icons.flash_on,
                    color: Colors.white,
                  ),
                ),
                MyTool(
                  onPressed: () {},
                  text: "Camera",
                  icon: const Icon(
                    Icons.switch_camera_outlined,
                    color: Colors.white,
                  ),
                ),
                MyTool(
                  text: "Gallery",
                  onPressed: () {},
                  icon: const Icon(
                    Icons.browse_gallery_outlined,
                    color: Colors.white,
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
