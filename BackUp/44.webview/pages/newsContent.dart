import 'package:flutter/material.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class NewsContentPage extends StatefulWidget {
  final Map arguments;
  const NewsContentPage({super.key, required this.arguments});

  @override
  State<NewsContentPage> createState() => _NewsContentPageState();
}

class _NewsContentPageState extends State<NewsContentPage> {
  // 注意 ios需要单独配置

  bool _hasLoading=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.arguments["aid"]);
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Column(
        children: [
          !_hasLoading?const LinearProgressIndicator():const Text(""),
          Expanded(child: InAppWebView(
            initialUrlRequest:URLRequest(
              url: Uri.parse("https://www.phonegap100.com/newscontent.php?aid=${widget.arguments["aid"]}")
            ),
            onProgressChanged: (controller, progress){
                print(progress/100);
                if(progress/100>0.999){
                  setState(() {
                    _hasLoading=true;
                  });
                }
            },
          ))
        ],
      ),
    );
  }
}
