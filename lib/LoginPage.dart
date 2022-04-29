import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/tabs/tabs_page.dart';
///登录界面
class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false, // 解决键盘顶起页面
      body: Container(
        padding: EdgeInsets.all(70),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              "assets/images/bg.jpg",
            ),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            Text(
              "Best Flash game",
              style: TextStyle(fontSize: 50, color: Colors.amber,fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            //输入手机号
            TextFormField(
              autofocus: false,
              //是否自动对焦
              keyboardType: TextInputType.phone,
              //设置键盘的输入类型，并将键盘输入模式设置为手机号
              //装饰
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  hintText: 'Please enter your mobile number',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))),
              //输入框校验
              // validator: (value) {
              //   RegExp reg = new RegExp(r'^\d{11}$');
              //   if (!reg.hasMatch(value!)) {
              //     return '请输入11位手机号码';
              //   }
              //   return null;
              // },
            ),
            const SizedBox(
              height: 20,
            ),

            //输入密码
            TextFormField(
              obscureText: true,
              autofocus: false,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                hintText: 'Please input password',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              ),
              // validator: (value) {
              //   if (value!.length < 6) {
              //     return '请输入正确的密码';
              //   }
              //   return null;
              // },
            ),
            const SizedBox(
              height: 100,
            ),
            Container(
              height: 44,
              width: MediaQuery.of(context).size.width - 110,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(5)),
              child: FlatButton(
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  ///跳转新闻和游戏列表界面
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return TabsPage();
                  }));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
