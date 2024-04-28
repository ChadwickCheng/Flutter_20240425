import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart'; // 用于多图预览

/*
使用photo_view实现图片放大缩小 打开图片可以左右滑动
*/

class HeroPage extends StatefulWidget {
  const HeroPage({super.key});

  @override
  State<HeroPage> createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  int curPage = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Hero(
        tag: 'imageHero',
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: Colors.black,
              body: Center(
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  // 单张 可以放大缩小
                  // child: PhotoView(
                  //   imageProvider: AssetImage('images/nero.png'),
                  // )
                  child: PhotoViewGallery.builder(
                    /*
                    按道理来说，跳转页面需要路由传参有几张图片与点击的是第几张，这里只是简单的演示
                    这个功能需要前端后端协商好，跳转前的页面需要设计好数据结构
                    后续开发请参考原始pdf
                    */
                    pageController: PageController(initialPage: 0), // 初始显示第几张
                    onPageChanged: (index) => { // 接收当前显示的是第几张
                      print(index),
                      setState(() {
                        curPage = index+1;
                      })
                    },
                    itemCount: 3,
                    builder: (context, index) {
                      return PhotoViewGalleryPageOptions(
                        imageProvider: AssetImage('images/nero.png'),
                        initialScale: PhotoViewComputedScale.contained,
                        minScale: PhotoViewComputedScale.contained,
                        maxScale: PhotoViewComputedScale.covered * 2,
                      );
                    },
                  )
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 20,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  '${curPage}/3',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    decoration: TextDecoration.none
                  ),
                )
              )
            )
          ],
        ),
      ),
    );
  }
}