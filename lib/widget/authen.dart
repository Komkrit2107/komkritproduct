import 'package:flutter/material.dart';
import 'package:kritproduct/utility/my_style.dart';
import 'package:kritproduct/widget/register.dart';

//สร้าง Authen Ctrl Z = เรียกคืนตั้งแต่ตัน
class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  //Field

  //Method ให้แสดงส่วนด้านล่าง โดยการเอา ให้แสดง Keyborad()
  Widget userForm() {
    return Container(
      width: 250.0,
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: MyStyle().textColor,
            ),
          ),
          hintStyle: TextStyle(color: MyStyle().textColor),
          hintText: 'User :',
        ),
      ),
    );
  }

  //สร้าง PasswordForm
  Widget passwordForm() {
    return Container(
      width: 250.0,
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: MyStyle().textColor,
            ),
          ),
          hintStyle: TextStyle(color: MyStyle().textColor),
          hintText: 'Password :',
        ),
      ),
    );
  }

  //Method ให้แสดงส่วนด้านล่าง โดยการเอา แสดง Logo()
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
        color: MyStyle().textColor,
      ),
    );
  }

  // สร้างปุ่ม Login และเปลี่ยนสีปุม ตัวหนังสือ

  Widget signInButton() {
    return RaisedButton(
      color: MyStyle().textColor,
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {},
    );
  }

  // สร้างปุ่ม Logout
  Widget singUpButton() {
    return OutlineButton(
      borderSide: BorderSide(color: MyStyle().textColor),
      child: Text(
        'Sign Up',
        style: TextStyle(color: MyStyle().textColor),
      ),
      onPressed: () {
        print('You Click SignUp');
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext buildContext) {
          return Register();
          
        });
       Navigator.of(context).push(materialPageRoute); //การทำ Route หน้าถัดไป

      },
    );
  }

  //ต้องการขายช่องห่าง และความสูงของ ปุ่ม
  Widget mySizebox() {
    return SizedBox(
      width: 5.0,
      height: 10.0,
    );
  }
  //ประกาศ ปุ่มเพื่อทำการ Login center ให้อยู่ตรงกลาง

  Widget showButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        signInButton(),
        mySizebox(),
        singUpButton(),
      ],
    );
  }

  //สร้าง Password ต้องกำหนด ด้านล่างนี้ด้วยทุกครั้ง
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: <Color>[Colors.white, MyStyle().mainColor],
            radius: 1.0,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              showLogo(),
              showAppName(),
              userForm(),
              passwordForm(),
              mySizebox(),
              showButton(),
            ],
          ),
        ),
      ),
    );
  }
}
