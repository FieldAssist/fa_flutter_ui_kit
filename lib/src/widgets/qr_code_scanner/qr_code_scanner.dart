import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScanner extends StatefulWidget {
  const QrCodeScanner({Key? key, this.validationRegex}) : super(key: key);

  final String? validationRegex;

  @override
  State<QrCodeScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrCodeScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  String? parsedData;
  final upiRegx = RegExp(r'[a-zA-Z0-9.\-_]{2,256}@[a-zA-Z]{2,64}');
  RegExp? validationRegex;

  @override
  void initState() {
    super.initState();
    if (widget.validationRegex != null) {
      validationRegex = RegExp(widget.validationRegex!);
    }
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 10,
            child: QRView(
              key: qrKey,
              cameraFacing: CameraFacing.back,
              overlay: QrScannerOverlayShape(
                borderRadius: 12,
                borderColor: Colors.green,
                borderWidth: 10,
                cutOutSize: 350,
              ),
              onQRViewCreated: (controller) {
                if (this.controller == null) {
                  setState(() {
                    this.controller = controller;
                  });
                }

                controller.resumeCamera(); //BUG

                controller.scannedDataStream.listen((scanData) {
                  if (scanData.code != null) {
                    if (upiRegx.hasMatch(scanData.code!)) {
                      parsedData = _extractUPIID(scanData.code!);
                    } else {
                      parsedData = scanData.code!;
                    }
                    result = scanData;
                    setState(() {});
                    controller.stopCamera();
                  }
                });
              },
            ),
          ),
          if (result != null)
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(parsedData ?? ''),
              ),
            ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: result != null
                  ? MainAxisAlignment.spaceAround
                  : MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    if (result != null) {
                      setState(() {
                        result = null;
                      });
                      controller?.resumeCamera();
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  color: Colors.red,
                  iconSize: 35,
                  icon: Icon(Icons.close_outlined),
                ),
                if (result != null)
                  IconButton(
                    onPressed: onPressSubmit,
                    color: Colors.green,
                    iconSize: 35,
                    icon: Icon(Icons.check_rounded),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void onPressSubmit() {
    if (result != null) {
      String? dataToReturn;

      if (widget.validationRegex != null &&
          validationRegex != null &&
          !validationRegex!.hasMatch(result!.code!)) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Scanned QR code does not match the validation checks, Please try again.",
            ),
          ),
        );
        return;
      }

      if (parsedData != null) {
        dataToReturn = parsedData;
      } else if (result!.code != null) {
        dataToReturn = result!.code!;
      } else {
        throw Exception("Scanned data is empty");
      }
      Navigator.pop(context, dataToReturn);
    }
  }

  String _extractUPIID(String scannedData) {
    final startIndex = scannedData.indexOf('?pa=') + 4;
    final endIndex = scannedData.indexOf('&');
    return scannedData.substring(startIndex, endIndex);
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
