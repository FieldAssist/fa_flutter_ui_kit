import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScanner extends StatefulWidget {
  const QrCodeScanner({Key? key}) : super(key: key);

  @override
  State<QrCodeScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrCodeScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

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
              onQRViewCreated: (controller) {
                setState(() {
                  this.controller = controller;
                });

                controller.resumeCamera(); //BUG

                controller.scannedDataStream.listen((scanData) {
                  if (scanData.code != null) {
                    setState(() {
                      result = scanData;
                    });
                    controller.stopCamera();
                  }
                });
              },
            ),
          ),
          if (result != null)
            Expanded(
              flex: 1,
              child: Text(result!.code ?? ''),
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
                    setState(() {
                      result = null;
                    });
                    controller?.resumeCamera();
                  },
                  color: Colors.red,
                  iconSize: 35,
                  icon: Icon(Icons.close_outlined),
                ),
                if (result != null)
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context, result?.code);
                    },
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

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
