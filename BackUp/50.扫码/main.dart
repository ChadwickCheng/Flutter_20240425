import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Title'),
        ),
        body: BarcodeScanPage(),
      )
    );
  }
}

class BarcodeScanPage extends StatefulWidget {
  const BarcodeScanPage({super.key});

  @override
  State<BarcodeScanPage> createState() => _BarcodeScanPageState();
}

class _BarcodeScanPageState extends State<BarcodeScanPage> {
  void _doBarcodeScan() async {
    var options = const ScanOptions(
        // set the options
        autoEnableFlash: true,
        strings: {
          'cancel': '取消',
          'flash_on': '打开Flash',
          'flash_off': '关闭Flash',
        });
    var result = await BarcodeScanner.scan(options: options);
    print(result.type); // The result type (barcode, cancelled, failed)
    print(result.rawContent); // The barcode content
    print(result.format); // The barcode format (as enum)
    print(result
        .formatNote); // If a unknown format was scanned this field contains a note
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("扫码演示")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _doBarcodeScan,
              child: const Text("扫描二维码 条形码"),
            )
          ],
        ),
      ),
    );
  }
}
