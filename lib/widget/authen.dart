import 'package:flutter/material.dart';
import 'package:kritproduct/utility/my_style.dart';

//สร้าง Authen Ctrl Z = เรียกคืนตั้งแต่ตัน
class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  //Field

  //Method ให้แสดงส่วนด้านล่าง โดยการเอา showAppName()

  Widget showLogo() {
    return Container(
      height: 120.0,
      child: Image.asset('images/logo.png'),
    );
  }

  //กำหนดสีต่าง ๆ และสร้าง Function เพื่อ Call MyStyle() ที่กำหนด
  Widget showAppName() {
    return Text(
      'Wealthrepublic',
      style: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color:MyStyle().textColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[showLogo(), showAppName()],
        ),
      ),
    );
  }
}
