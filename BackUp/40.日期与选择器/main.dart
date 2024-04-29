import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      home:TimeDemo(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('zh', 'CH'),
        const Locale('en', 'US'),
      ],
    );
  }
}

class TimeDemo extends StatefulWidget {
  const TimeDemo({super.key});
  @override
  State<TimeDemo> createState() => _TimeDemoState();
}

class _TimeDemoState extends State<TimeDemo> {

  @override
  void initState() {
    super.initState();
    // 1. 获取日期
    DateTime d = DateTime.now();
    // 转为字符串
    var str = '${d.year}-${d.month}-${d.day} ${d.hour}:${d.minute}:${d.second}';
    // 2. 获取时间戳 自1970年1月1日以来的毫秒数 可以保证唯一
    var ms = d.millisecondsSinceEpoch; // 13位
    // 3. 时间戳转日期
    var d2 = DateTime.fromMillisecondsSinceEpoch(ms);
    // 4. 日期字符串转日期
    var d3 = DateTime.parse('2021-10-10 10:10:10');
    // Num类型转日期
    var d4 = DateTime(2030, 10, 10, 10, 10, 10);
    // 5. 时间加减
    var d5 = d.add(Duration(days: 1)); // 加一天
    var d6 = d.subtract(Duration(days: 1)); // 减一天
    // 6. TimeOfDay获取时间
    var t = TimeOfDay.now();
  }

  DateTime _dateTime = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${_dateTime.year}年${_dateTime.month}月${_dateTime.day}日'),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
              // 日期选择框 类似于antd的DatePicker 异步
              // 默认英文的  用户可能看不懂 国际化
              /*
              1. pubspec.yaml
              2. main.dart引入
              3. MaterialApp配置
              */
              onTap: () async {
                var _d = await showDatePicker(
                  context: context, 
                  initialDate: _dateTime,
                  firstDate: DateTime(1937,1,1), 
                  lastDate: DateTime(2035,1,1)
                );
                if(_d == null) return;
                setState(() {
                  _dateTime = _d;
                });
              },
            ),
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${_time.hour}时${_time.minute}分'),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
              // 时间选择框
              onTap: () async {
                var _t = await showTimePicker(
                  context: context, 
                  initialTime: _time
                );
                if(_t == null) return;
                setState(() {
                  _time = _t;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}