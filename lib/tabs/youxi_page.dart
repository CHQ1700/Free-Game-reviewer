import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/YouxiInfoPage.dart';
///游戏列表界面
class YouxiPage extends StatefulWidget {
  @override
  State<YouxiPage> createState() => _YouxiPageState();
}

class _YouxiPageState extends State<YouxiPage> {
  ///游戏集合
  List<String> _list = [];

  @override
  void initState() {
    super.initState();
    _list.add("League Of Legend");
    _list.add("Happy");
    _list.add("Glory of Kings");
    _list.add("Game for Peace");
    _list.add("After tomorrow");
    _list.add("Naruto");
    _list.add("OW");
    _list.add("God");
    _list.add("BLALA");
    _list.add("Disappearance");
    _list.add("Walking dead");
    _list.add("Fly to the moon");
    _list.add("CrossFire");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Game',
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

  ////生成游戏列表内容
  List<Widget> _buildItems() {
    List<Widget> list = [];
    for (var element in _list) {
      list.add(_buildItem(element));
    }
    return list;
  }

  ///游戏列表item
  Widget _buildItem(String name) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          height: 50,
          child: Row(
            children: [
              Expanded(
                child: Text("${name}"),
              ),
              InkWell(
                onTap: () {
                  ///跳转游戏详情界面
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return YouxiInfoPage(
                      title: name,
                    );
                  }));
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    'Download',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ),
            ],
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
