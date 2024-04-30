import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

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
      home:DioDemo(),
    );
  }
}

class DioDemo extends StatefulWidget {
  const DioDemo({super.key});
  @override
  State<DioDemo> createState() => _DioDemoState();
}

class _DioDemoState extends State<DioDemo> {
  // 注意 urllauncher在ios需要单独配置
  // 设备和网络信息不需要额外配置
  /*
  获取设备信息
  */
  late List<Widget> _list;
  _getDeviceInfo() async{
    final deviceInfoPlugin = DeviceInfoPlugin();
    final deviceInfo = await deviceInfoPlugin.deviceInfo;
    final allInfo = deviceInfo.data;

    var tempList = allInfo.entries.map((e){
      return ListTile(
        title: Text('${e.key}:${e.value}'),
      );
    }).toList();
    setState(() {
      _list = tempList;
    });
  }

  /*
  检测网络变化
  需要async库
  */
  late StreamSubscription<List<ConnectivityResult>> subscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDeviceInfo();

    subscription = Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result) {
      if(result == ConnectivityResult.wifi){
        print("wifi");
      }else if(result ==ConnectivityResult.mobile){
         print("手机网络");
      }else if(result==ConnectivityResult.ethernet){
        print("ethernet");
      }else{
        print("没有网络");
      }
  });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    subscription.cancel();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Demo'),
      ),
      body: ListView(
        // children: _list,
        children: [
          // 打开浏览器
          ElevatedButton(
            onPressed: () async{
              Uri url = Uri.parse('https://tutti.fan');
              if(await canLaunchUrl(url)){
                await launchUrl(url);
              }else{
                throw 'Could not launch $url';
              }
            },
            child: Text('打开浏览器'),
          ),
          // 打电话发短信要设置xml
          const SizedBox(height: 10),
          ElevatedButton(
            child: const Text('拨打电话'),
            onPressed: () async {
              final Uri tel = Uri.parse('tel:10086');
              if (await canLaunchUrl(tel)) {
                await launchUrl(tel);
              } else {
                throw 'Could not launch $tel';
              }
            },
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            child: const Text('发送短信'),
            onPressed: () async {
              final Uri tel = Uri.parse('sms:10086');               
              if (await canLaunchUrl(tel)) {
                await launchUrl(tel);
              } else {
                throw 'Could not launch $tel';
              }
            },
          ),
          const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('打开支付宝'),
              onPressed: () async {
                final Uri tel = Uri.parse('alipays://');               
                if (await canLaunchUrl(tel)) {
                  await launchUrl(tel);
                } else {
                  throw 'Could not launch $tel';
                }
              },
            ),   
          const SizedBox(height: 10),
          ElevatedButton(
            child: const Text('打开外部应用-高德地图'),
            onPressed: () async {
              //https://lbs.amap.com/tools/picker
              String title = "北京大学";
              String latitude = "39.992806";  //纬度
              String longitude = "116.310905";  //	经度
              // 需要io库
              Uri uri = Uri.parse(
                  '${Platform.isAndroid ? 'android' : 'ios'}amap://navi?sourceApplication=amap&lat=$latitude&lon=$longitude&dev=0&style=2&poiname=$title');
            
              try {
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                } else {
                  print('无法调起高德地图');
                }
              } catch (e) {
                print('无法调起高德地图');
              }
            }
          ),
        ]
      ),
    );
  }
}