import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/WebPage.dart';

///新闻界面
class XinwenPage extends StatefulWidget {
  @override
  State<XinwenPage> createState() => _XinwenPageState();
}

class _XinwenPageState extends State<XinwenPage> {
  ///新闻列表
  Map<String, String> _map = {};

  @override
  void initState() {
    super.initState();
    _map["Global Times"] = "https://www.globaltimes.cn/";
    _map["People's Daily Online"] = "http://en.people.cn/";
    _map["Semantic Scholar"] = "https://www.semanticscholar.org/";
    _map["Youtube"] = "https://www.youtube.com/?gl=ES/";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'News',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orange,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: _buildItems(),
      ),
    );
  }

  ///生成新闻列表
  List<Widget> _buildItems() {
    List<Widget> list = [];
    _map.forEach((key, value) {
      list.add(_buildItem(key, value));
    });
    return list;
  }

  ///新闻列表item
  Widget _buildItem(String name, String url) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            ///跳转新闻详情界面
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return WebViewPage(
                title: name,
                url: url,
              );
            }));
          },
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 50,
            child: Text("${name}"),
          ),
        ),
        Container(
          width: double.infinity,
          height: 0.5,
          color: Colors.black12,
        ),
      ],
    );
  }
}
