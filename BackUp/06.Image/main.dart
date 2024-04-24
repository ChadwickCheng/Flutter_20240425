import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Tutti.fan'),
      ),
      body: const Column(
        children: <Widget>[
          MyImage(),
          SizedBox(height: 20,),
          CircleImageByDecoration(),
          SizedBox(height: 20,),
          CircleImageByClipOval(),
          SizedBox(height: 20,),
          CircleImageByCircleAvatar(),
        ]
      ),
    ),
  ));
}

class MyImage extends StatelessWidget {
  const MyImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.network(
          'https://www.itying.com/themes/itying/images/ionic4.png',
          scale: 2, // 缩放
          alignment: Alignment.topCenter, // 对齐
          fit: BoxFit.cover, // 填充
          repeat: ImageRepeat.repeat, // 重复
        )
      )
    );
  }
}

// decoration实现圆形图片本质是背景图片
class CircleImageByDecoration extends StatelessWidget {
  const CircleImageByDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: const BoxDecoration(
        color: Colors.tealAccent,
        image: DecorationImage(
          image: NetworkImage('https://www.itying.com/themes/itying/images/ionic4.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(Radius.circular(75)),
      ),
    );
  }
}

// clipoval实现圆形图片本质是裁剪
class CircleImageByClipOval extends StatelessWidget {
  const CircleImageByClipOval({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.network(
        'https://www.itying.com/themes/itying/images/ionic4.png',
        width: 150,
        height: 150,
        fit: BoxFit.cover,
      ),
    );
  }
}

// CircleAvatar实现圆形图片
class CircleImageByCircleAvatar extends StatelessWidget {
  const CircleImageByCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundImage: AssetImage("images/nero.png"),
      radius: 75,
    );
  }
}

/*
图片不显示就清缓存
flutter clean
flutter pub get
flutter run
*/