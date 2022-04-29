import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';

///游戏详情界面
class YouxiInfoPage extends StatefulWidget {
  ///游戏名字
  String? title;

  YouxiInfoPage({this.title});

  @override
  State<YouxiInfoPage> createState() => _YouxiInfoPageState();
}

class _YouxiInfoPageState extends State<YouxiInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.title}',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orange,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          color: Colors.black,
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false, // 解决键盘顶起页面
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: Image.asset(
              "assets/images/lol.webp",
            ),
          ),
          Container(
            width: double.infinity,
            height: 0.5,
            color: Colors.black12,
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                height: 30,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(5)),
                child: Text(
                  'download',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              ),
            ),
          ),
          ///游戏描述
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.all(20),
            child: Text("${widget.title}"),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Image.asset(
              "assets/images/lol.webp",

            ),
          ),
        ],
      ),
    );
  }
}
