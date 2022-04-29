import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled2/tabs/xinwen_page.dart';
import 'package:untitled2/tabs/youxi_page.dart';

import '../keepalive_warpper.dart';

class TabsPage extends StatefulWidget {
  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int lastTime = 0;
  final pages = [
    KeepAliveWrapper(child: XinwenPage()),
    KeepAliveWrapper(child: YouxiPage()),
  ];
  late PageController pageController = PageController(initialPage: 0);
  var page = 0;

  void onJumpTo(int index, {pageChange = false}) {
    setState(() {
      if (!pageChange) {
        pageController.jumpToPage(index);
      }
      page = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: PageView(
            children: pages,
            controller: pageController,
            onPageChanged: (index) => onJumpTo(index, pageChange: true),
            physics: const NeverScrollableScrollPhysics(),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            color: Colors.orange,
            shape: const CircularNotchedRectangle(),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        onTap(0);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.home,
                            color: getColor(context, 0),
                          ),
                          Text("New",
                              style: TextStyle(color: getColor(context, 0)))
                        ],
                      )),
                  GestureDetector(
                      onTap: () {
                        onTap(1);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.insert_chart, color: getColor(context, 1)),
                          Text("Game",
                              style: TextStyle(color: getColor(context, 1)))
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
        onWillPop: () async {
          int newTime = DateTime.now().millisecondsSinceEpoch;
          int result = newTime - lastTime;
          lastTime = newTime;
          if (result < 2000) {
            Fluttertoast.showToast(msg: "Press again to exit");
          } else {
            SystemNavigator.pop();
          }
          return true;
        });
  }

  Color getColor(BuildContext context, int value) {
    return page == value
        ? Theme.of(context).cardColor
        : Color.fromRGBO(105, 105, 105, 1.0);
    //255, 218, 68, 1.0颜色代码Color.fromRGBO(255, 218, 68, 1.0)
  }

  void onTap(int value) {
    setState(() {
      pageController.animateToPage(value,
          duration: const Duration(milliseconds: 100), curve: Curves.ease);
    });
  }
}

class SlidePageRouteBuilder extends PageRouteBuilder {
  final Widget widget;

  SlidePageRouteBuilder(this.widget)
      : super(
            transitionDuration: const Duration(seconds: 1),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return widget;
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(0.0, 1.0),
                        end: const Offset(0.0, 0.0))
                    .animate(CurvedAnimation(
                        parent: animation, curve: Curves.fastOutSlowIn)),
                child: child,
              );
            });
}
