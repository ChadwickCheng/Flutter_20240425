import 'package:flutter/material.dart';

class MyDia extends Dialog{
  final String? title;
  final String? content;
  final Function()? onTap;

  MyDia({Key? key, required this.content, required this.title, required this.onTap}) : super(key: key);
  
  @override
  Widget build(BuildContext context){
    return Material(
      type: MaterialType.transparency,//背景透明 否则默认纯白背景
      child: Center(
        child: Container( // 不使用center不会生效宽高
          height: 240,
          width: 240,
          color: Colors.red,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        title ?? '标题',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                        )
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell( // InkWell 有点击效果
                        child: Icon(Icons.close),
                        onTap: onTap,
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  width: double.infinity,
                  child: Text(
                    content ?? '内容',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white
                    )
                  ),
                )
              )
            ]
          )
        )
      )
    );
  }
}