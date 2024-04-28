import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  final double width;
  final double height;
  final String src;

  ImagePage({super.key, this.width=double.infinity, this.height=200, this.src='images/nero.png'});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Image.asset(src, fit: BoxFit.cover,),
    );
  }
}