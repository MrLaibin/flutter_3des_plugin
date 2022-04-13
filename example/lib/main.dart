import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_3des_plugin/flutter_3des_plugin.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  // _data， _key 数据为测试数据， 实际开发根据项目需求规则生成
  // 2005261620000123
  final String _data = '5032303100000000';
  final String _key = '7472656E646974303132333435363738';
  String? _result = '';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // 3des 加密
  encrypt() {
    Flutter3desPlugin.encrypt(_key, "5032303100000000").then((res) {
      setState(() {
        _result = res;
      });
      log("加密后的数据：$res");
    });
    //
    // Flutter3desPlugin.decrypt("7472656E646974303132333435363738",
    //         "5160137f6092ba608a271abdc4134840")
    //     .then((res) {
    //   log("解密后的数据：$res");
    // });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('flutter 3des plugin example'),
        ),
        body: Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text('Running on: $_platformVersion'),
              new Text('加密的data： $_data'),
              new Text('加密的key： $_key'),
              TextButton(
                onPressed: () {
                  encrypt();
                },
                child: Text("执行311des加密"),
              ),
              new Text('加密的结果： $_result'),
            ],
          ),
        ),
      ),
    );
  }
}
