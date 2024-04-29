import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_html/flutter_html.dart';

class NewsContentPage extends StatefulWidget {
  final Map arguments;
  const NewsContentPage({super.key, required this.arguments});

  @override
  State<NewsContentPage> createState() => _NewsContentPageState();
}

class _NewsContentPageState extends State<NewsContentPage> {
  /*
  两种方式展示html
  1. 直接解析
  2. WebView使用浏览器内核加载html
  */
  List _list = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('arguments: ${widget.arguments}');
    _getData();
  }

  _getData() async {
    String apiUri =
        "https://www.phonegap100.com/appapi.php?a=getPortalArticle&aid=${widget.arguments["aid"]}";
    var response = await Dio().get(apiUri);
    var res = json.decode(response.data);
    print(res);
    setState(() {
      _list = json.decode(response.data)["result"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: _list.isNotEmpty
          ? ListView(
              children: [
                Text("${_list[0]["title"]}",textAlign: TextAlign.center,style: const TextStyle(
                  fontSize: 26
                )),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Html(
                    data: _list[0]["content"],
                    style: {
                      "body":Style(
                        backgroundColor: Colors.white
                      ),
                      "p":Style(
                        fontSize: FontSize.large
                      ),
                    },
                    // onImageTap: ((url, context, attributes, element) {
                    //     print(url);
                    // }),
                    // onLinkTap: (url, context, attributes, element) {
                    //    print(url);
                    //   //  webView
                    // }
                  ),
                ),             
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
