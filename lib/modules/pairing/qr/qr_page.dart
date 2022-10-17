import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../services/locator.dart';
import '../../../shared_widgets/toasts.dart';
import 'qr.dart';

class QrPage extends StatefulWidget {
  const QrPage({Key? key}) : super(key: key);

  @override
  _QrReadState createState() => _QrReadState();
}

class _QrReadState extends State<QrPage> {
  final qrBloc = locator.get<QrBloc>();

  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool stop = false;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                  borderColor: Colors.red,
                  borderRadius: 10,
                  borderLength: 30,
                  borderWidth: 10,
                  cutOutSize: scanArea),
            ),
            const Positioned(
                height: 60,
                width: 50,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: BackButton(
                    color: Colors.white,
                  ),
                )),
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        Barcode scan = scanData;
        if (!stop) {
          qrBloc.qrCode = '';
          stop = true;
          controller.pauseCamera();
          Future.delayed(const Duration(milliseconds: 400), () async {
            controller.resumeCamera();
            stop = false;
            if (scan.code == null) {
              showToast('Scan Failed. Try again');
              return;
            }
            qrBloc.qrCode = scan.code!;
            Navigator.of(context).pop();
          });
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
