import 'dart:convert';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kritproduct/utility/models/user_model.dart';
import 'package:kritproduct/utility/my_style.dart';
import 'package:kritproduct/utility/normal_dialog.dart';
import 'package:kritproduct/widget/list_product.dart';
import 'package:kritproduct/widget/register.dart';

//สร้าง Authen Ctrl Z = เรียกคืนตั้งแต่ตัน
class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  //Field

  String user, password;

  //Method ให้แสดงส่วนด้านล่าง โดยการเอา ให้แสดง Keyborad()
  Widget userForm() {
    return Container(
      width: 250.0,
      child: TextField(
        onChanged: (value) {
          user = value.trim();
        },
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
        obscureText: true,
        onChanged: (value) {
          password = value.trim();
        },
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
      child: Image.asset('images/logo12.png'),
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
      onPressed: () {
        if (user == null ||
            user.isEmpty ||
            password == null ||
            password.isEmpty) {
          normalDialog(context, 'มีช่องว่าง', 'กรุณา กรอกทุกช่อง สิ คะ');
        } else {
          checkAuthen();
        }
      },
    );
  }
  //ตรวจสอบค่า และประกาศตัวแปรชื่อ checkAuthen

  Future<void> checkAuthen() async {
    String url =
        'https://www.androidthai.in.th/feb13/getUserWhereUserKrit.php?isAdd=true&User=$user';
    try {
      Response response = await Dio().get(url);
      print('reponse =$response');
      if (response.toString() == 'null') {
        normalDialog(context, 'User False', 'No $user in my Database');
      } else {
        // ถอนรหัสออกมาเป็น ภาษาไทย จาก json
        var result = json.decode(response.data);
        print('result = $result');
        for (var map in result) {
          print('map = $map');
          UserModel userModel = UserModel.fromMap(map);

          if (password == userModel.password) {
            MaterialPageRoute materialPageRoute =
                MaterialPageRoute(builder: (BuildContext buildContext) {
              return ListProduct(userModel: userModel,);
            });
            Navigator.of(context).push(materialPageRoute);
          } else {
            normalDialog(
                context, 'Password False', 'Try Agains Password False');
          }
        }
      }
    } catch (e) {}
  }

  // สร้างปุ่ม ลงทะเบียน ก่อน
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
