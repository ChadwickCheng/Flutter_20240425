import 'package:flutter/material.dart';
import './pages/hero.dart';

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
      home: AnimeDemo(),
    );
  }
}

class AnimeDemo extends StatefulWidget {
  const AnimeDemo({super.key});

  @override
  State<AnimeDemo> createState() => _AnimeDemoState();
}

class _AnimeDemoState extends State<AnimeDemo> with SingleTickerProviderStateMixin {
  /*
  hero动画 用于在两个页面之间的图片切换
  */

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Anime Demo'),
        ),
        body: 
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HeroPage()));
              },
              child: Hero(
                tag: 'imageHero', // tag需要一致
                child: Image.asset('images/nero.png'),
              ),
            ),
          )
      ),
    );
  }
}
