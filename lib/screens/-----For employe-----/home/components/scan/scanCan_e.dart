// ignore_for_file: camel_case_types, use_super_parameters, avoid_print, file_names

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:recycle_app/core/app_routes.dart';
import 'package:recycle_app/core/assets.dart';
import 'package:sizer/sizer.dart';

class Scan_E extends StatefulWidget {
  const Scan_E({Key? key}) : super(key: key);

  @override
  State<Scan_E> createState() => _Scan_EState();
}

class _Scan_EState extends State<Scan_E> {
  String _scannedBarcode = 'Waiting for scan...';
  int _itemCount = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Scanner Section with Frame Overlay
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Iconsax.arrow_left)),
                  Text("Scan  ",
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 20.sp)),
                  Image.asset(
                    Assets.employee,
                    scale: 4,
                  )
                ],
              ),
              Divider(
                height: 1.h,
                color: Colors.transparent,
              ),
              Stack(
                children: [
                  Container(
                    height: 50.h,
                    width: 100.w,
                    color: Colors.grey[200],
                    child: MobileScanner(
                      onDetect: (barcode, args) {
                        if (barcode.rawValue != null) {
                          setState(() {
                            _scannedBarcode = barcode.rawValue!;
                          });
                        }
                      },
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Frame Overlay
                  // Positioned.fill(
                  //   child: CustomPaint(
                  //     painter: BarcodeFramePainter(),
                  //   ),
                  // ),
                ],
              ),

              // Item Details Section
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Scanned Item: $_scannedBarcode",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        children: [
                          Text(
                            "Item : V cola 320ml",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              if (_itemCount > 1) {
                                setState(() {
                                  _itemCount--;
                                });
                              }
                            },
                            icon: Icon(
                              Icons.remove_circle_outline,
                              color: Colors.red,
                              size: 20.sp,
                            ),
                          ),
                          Text(
                            _itemCount.toString(),
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _itemCount++;
                              });
                            },
                            icon: Icon(
                              Icons.add_circle_outline,
                              color: Colors.green,
                              size: 20.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildDetailRow("Material", "Metal"),
                          _buildDetailRow("Weight", "12g"),
                          _buildDetailRow("Capacity", "320ml"),
                        ],
                      ),
                      Row(
                        children: [],
                      ),
                      Spacer(),
                      SizedBox(
                        width: double.infinity,
                        height: 7.h,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 41.w,
                              height: 7.h,
                              child: ElevatedButton(
                                onPressed: () {
                                  print("Barcode Scanned: $_scannedBarcode");
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text(
                                  "Add",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Spacer(),
                            SizedBox(
                              width: 41.w,
                              height: 7.h,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(App_Routes.cart_E);
                                  print("Barcode Scanned: $_scannedBarcode");
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text(
                                  "Continue",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        children: [
          Text(
            "$label ",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
          Divider(
            height: 1.h,
            color: Colors.transparent,
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

// class BarcodeFramePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.green
//       ..strokeWidth = 3
//       ..style = PaintingStyle.stroke;

//     // Define frame dimensions (centered rectangle)
//     final frameWidth = size.width * 0.8;
//     final frameHeight = size.height * 0.2;
//     final frameLeft = (size.width - frameWidth) / 2;
//     final frameTop = (size.height - frameHeight) / 2;

//     // Draw rectangle
//     final rect = Rect.fromLTWH(frameLeft, frameTop, frameWidth, frameHeight);
//     canvas.drawRect(rect, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }
