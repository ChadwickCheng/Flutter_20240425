import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({super.key});

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  final ImagePicker _picker = ImagePicker();
  XFile? _pickedFile;
  //拍照
  _pickerCamera() async {
    XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.camera, maxWidth: 800, maxHeight: 800);
    if (pickedFile != null) {
      // print(pickedFile.path);
      setState(() {
        _pickedFile = pickedFile;
      });
    }
  }

  //相册选择
  _pickerGallery() async {
    XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery, maxWidth: 800, maxHeight: 800);
    if (pickedFile != null) {
      setState(() {
        _pickedFile = pickedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            ElevatedButton(onPressed: _pickerCamera, child: const Text("拍照")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: _pickerGallery, child: const Text("相册选择")),
            const SizedBox(height: 20),
            _pickedFile == null
                ? const Text("选择照片...")
                : Image.file(File(_pickedFile!.path)), //引入dart:io库
          ],
        ),
      ),
    );
  }
}
