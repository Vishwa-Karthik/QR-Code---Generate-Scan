import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code/Widgets/button.dart';
import 'package:qr_code/Widgets/tool.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRGenerate extends StatefulWidget {
  const QRGenerate({super.key});

  @override
  State<QRGenerate> createState() => _QRGenerateState();
}

class _QRGenerateState extends State<QRGenerate> {
  //* text controller
  final TextEditingController _textEditingController = TextEditingController();

  //* text data to generate qr
  var data = "Vishwa Karthik";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //* app bar
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Generate QR",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),

      //* body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              //* show QR code
              QrImage(
                data: data,
                size: 230,
                version: QrVersions.auto,
              ),

              const SizedBox(
                height: 45,
              ),

              //* input field
              TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      HapticFeedback.heavyImpact();
                      _textEditingController.clear();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                  filled: true,
                  fillColor: Colors.white10,
                  focusColor: Colors.brown,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  enabled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  hintText: "Enter text",
                  hintStyle: Theme.of(context).textTheme.headline2,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              //* generate button
              MyButton(
                text: "Generate QR",
                onPressed: () {
                  HapticFeedback.heavyImpact();
                  setState(() {
                    data = _textEditingController.text;
                  });
                },
                icon: const Icon(Icons.qr_code),
              ),

              const SizedBox(
                height: 35,
              ),

              //* tools
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //*save
                  MyTool(
                    icon: const Icon(Icons.download),
                    text: "Save",
                    onPressed: () {
                      HapticFeedback.heavyImpact();
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
