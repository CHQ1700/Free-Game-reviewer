import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/tabs/tabs_page.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';

///新闻详情界面
class WebViewPage extends StatefulWidget {
  ///新闻标题
  String? title;

  ///新闻网址
  String? url;

  WebViewPage({this.title, this.url});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
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
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false, // 解决键盘顶起页面
      body: Container(
        child: WebView(
          initialUrl: '${widget.url}',
          javascriptMode: JavascriptMode.unrestricted,
          onPageStarted: (String url) {
            print("onPageStarted $url");
          },
          onPageFinished: (String url) {
            print("onPageFinished $url");
          },
          onWebResourceError: (error) {
            print("${error.description}");
          },
        ),
      ),
    );
  }
}
