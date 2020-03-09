import 'dart:convert';
//import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kritproduct/utility/models/user_model.dart';
import 'package:kritproduct/utility/my_style.dart';
import 'package:kritproduct/utility/normal_dialog.dart';
//import 'package:kritproduct/widget/list_product.dart';
import 'package:kritproduct/widget/register.dart';
import 'package:kritproduct/widget/mainmenu.dart';

//import 'main_menu.dart';

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
              color: MyStyle().b1,
            ),
          ),
          hintStyle: TextStyle(
            fontFamily: 'RobotoMono',
            fontSize: 20.0,
            color: MyStyle().b1),
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
              color: MyStyle().b1,
            ),
          ),
          hintStyle: TextStyle(
            fontFamily: 'RobotoMono',
            fontSize: 20.0,
            color: MyStyle().b1),
          hintText: 'Password :',
        ),
      ),
    );
  }

  //Method ให้แสดงส่วนด้านล่าง โดยการเอา แสดง Logo()
  Widget showLogo() {
    return Container(
      height: 80.0,
      child: Image.asset('images/logo12.png'),
    );
  }

  //กำหนดสีต่าง ๆ และสร้าง Function เพื่อ Call MyStyle() ที่กำหนด
  Widget showAppName() {
    return Text(
      'Wealth Republic Mutual Fund Brokerage Securities Co.,Ltd. ',
      style: TextStyle(
        fontFamily: 'RobotoMono',
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
        color: MyStyle().b1,
      ),
    );
  }


 Widget showThaiName() {
    return Text(
      'บริษัทหลักทรัพย์นายหน้าซื้อขายหน่วยลงทุน เวลท์ รีพับบลิค จำกัด',
      style: TextStyle(
        fontFamily: 'RobotoMono',
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
        color: MyStyle().b1,
      ),
    );
  }


   Widget showsAppName() {
    return Text(
      'SmartFund Link V 1.8+',
      style: TextStyle(
        fontFamily: 'RobotoMono',
        fontSize: 30.0,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
        color: MyStyle().b1,
      ),
    );
  }


  // สร้างปุ่ม Login และเปลี่ยนสีปุม ตัวหนังสือ

  Widget signInButton() {
    return RaisedButton(
      color: MyStyle().b1,
      child: Text(
        'Sign In',
        style: TextStyle(
          fontFamily: 'RobotoMono',
          fontSize: 20.0,
          color: Colors.white),
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
              return Menus(userModel: userModel,);
              //return ListProduct(userModel: userModel,);
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
      borderSide: BorderSide(color: MyStyle().b1),
      child: Text(
        'Sign Up',
        style: TextStyle(color: MyStyle().b1),
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
      width: 20.0,
      height: 10.0,
    );
  }

Widget mySpacebox() {
    return SizedBox(
      width: 5.0,
      height: 40.0,
    );
  }

Widget mySpace10box() {
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
            colors: <Color>[Colors.white, MyStyle().main2Color],
            radius: 40.0,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              showsAppName(),
              mySpacebox(),
              showLogo(),
              mySpace10box(),
              mySpace10box(),
              showThaiName(),
              showAppName(),
              mySpacebox(),
              userForm(),
              passwordForm(),
              mySizebox(),
              showButton(),
              mySpace10box(),
              mySpace10box(),
            ],
          ),
        ),
      ),
    );
  }
}
