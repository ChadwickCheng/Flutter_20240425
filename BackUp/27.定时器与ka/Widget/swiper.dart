import 'package:flutter/material.dart';
import 'imagePage.dart';
import 'dart:async';

class Swiper extends StatefulWidget {

  final double width;
  final double height;
  final List<String> list;

  Swiper({super.key, this.width=double.infinity, this.height=200, required this.list});
  @override
  State<Swiper> createState() => _SwiperState();
}

class _SwiperState extends State<Swiper> {

  int _curPageIdx = 0; // 用于指示器样式判断
  List<Widget> pageList = [];
  // 自动轮播需要pageview的controller
  late PageController _pageController;
  late Timer tid;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: 0);
    pageList = widget.list.map((e) => ImagePage(src: e)).toList();

    tid = Timer.periodic(Duration(seconds: 5), (timer) {
      _pageController.animateToPage(
        (_curPageIdx + 1) % pageList.length,
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut
      );
    });
  }

  @override
  void dispose() {
    tid.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container( // pageview默认会占满屏幕，所以需要一个容器包裹
          height: 200,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (idx) => setState(() => _curPageIdx = idx%widget.list.length),
            itemCount: 1000, // 实现无限轮播
            itemBuilder: (BuildContext context, int index) {
              return pageList[index % 3];
            },
          ),
        ),
        Positioned(
          left: 0,
          right: 0, // l0r0占满整行
          bottom: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.list.length, (idx){
              return Container(
                margin: EdgeInsets.all(5),
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: idx == _curPageIdx ? Colors.red : Colors.grey,
                  shape: BoxShape.circle,
                ),
              );
            }).toList()
          )
        )
      ],
    );
  }
}