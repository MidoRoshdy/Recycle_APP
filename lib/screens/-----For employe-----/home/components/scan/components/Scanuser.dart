// ignore_for_file: use_key_in_widget_constructors, file_names, avoid_print, depend_on_referenced_packages, use_super_parameters, avoid_unnecessary_containers
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:recycle_app/core/app_routes.dart';
import 'package:recycle_app/core/assets.dart';
import 'package:recycle_app/screens/-----For%20employe-----/home/components/scan/components/congrats_addpoints.dart';
import 'package:sizer/sizer.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  List<String> scannedCodes = [];
  List<String> userNames = [];
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose(); // Dispose the controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Scan'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: 2.h),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: LinearProgressIndicator(
                              value: 1,
                              backgroundColor: Colors.grey.shade300,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Expanded(
                    child: QRViewWidget(onQRViewCreated: _onQRViewCreated),
                  ),
                  SizedBox(height: 2.h),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Container(
                            width: 90.w,
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Image.asset(Assets.person,
                                        width: 20.w, height: 20.w),
                                  ],
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Text(
                                        "Ream Waleed",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "   @ReamWaleed123",
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.grey),
                                      ),
                                      Row(children: [
                                        Text(
                                          "15000 Points",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                        VerticalDivider(
                                          color: Colors.transparent,
                                          width: 1.w,
                                        ),
                                        Text(
                                          "+200 Points",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.green),
                                        ),
                                      ])
                                    ],
                                  ),
                                )
                              ],
                            ));
                      },
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        minimumSize: const Size(double.infinity, 48),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CongratsAddingPoints()),
                        );
                      },
                      child: const Text('Confirm',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ),
                  SizedBox(height: 2.h),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController qrController) {
    controller = qrController;
    controller?.scannedDataStream.listen((scanData) {
      if (!scannedCodes.contains(scanData.code)) {
        setState(() {
          scannedCodes.add(scanData.code ?? "Unknown Code");
          // Add logic to fetch student names if needed
          userNames.add("user Name"); // Replace with real data
        });
      }
    });
  }
}

class QRViewWidget extends StatelessWidget {
  final Function(QRViewController) onQRViewCreated;

  const QRViewWidget({Key? key, required this.onQRViewCreated})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QRView(
      key: GlobalKey(debugLabel: 'QR'),
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.green,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: 250,
      ),
    );
  }
}
