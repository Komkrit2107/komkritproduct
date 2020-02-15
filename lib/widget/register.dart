import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kritproduct/utility/my_style.dart';
import 'package:kritproduct/utility/normal_dialog.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //Field ประกาศตัวแปร
  String name, user, password, rePassword ;
  String idciticent, telephone, email;

  //Method กำหนดรูปคน และกำหนดค่าสี
  Widget nameForm() {
    //ประกาศตัวแปร เป็นสี
    Color color = Colors.purple.shade700;
    return TextField(
      onChanged: (String string) {
        name = string.trim();
      },
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color),
          ),
          helperStyle: TextStyle(color: color),
          helperText: 'Type Your Name in blank',
          labelStyle: TextStyle(color: color),
          labelText: 'User Name:',
          icon: Icon(
            Icons.person,
            size: 36.0,
            color: color,
          )),
    );
  }
  
  //Title Bar นำไปใส่ไว้ใน Appbar
  Widget showSTitle() {
    return Text('Register');
  }

  Widget emailForm() {
    //ประกาศตัวแปร เป็นสี
    Color color = Colors.purple;
    return TextField(
      onChanged: (String string) {
        user = string.trim();
      },
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color),
          ),
          helperStyle: TextStyle(color: color),
          helperText: 'Type Your Name in blank',
          labelStyle: TextStyle(color: color),
          labelText: 'Email Address:',
          icon: Icon(
            Icons.mail_outline,
            size: 36.0,
            color: color,
          )),
    );
  }

   Widget telephonForm() {
    //ประกาศตัวแปร เป็นสี
    Color color = Colors.purple;
    return TextField(
      onChanged: (String string) {
        telephone = string.trim();
      },
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color),
          ),
          helperStyle: TextStyle(color: color),
          helperText: 'Type Your Telephone in blank',
          labelStyle: TextStyle(color: color),
          labelText: 'Telephone No:',
          icon: Icon(
            Icons.phone_in_talk,
            size: 36.0,
            color: color,
          )),
    );
  }

  Widget passwordForm() {
    //ประกาศตัวแปร เป็นสี
    Color color = Colors.blueGrey;
    return TextField(
      obscureText: true,
      onChanged: (String string) {
        password = string.trim();
      },
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color),
          ),
          helperStyle: TextStyle(color: color),
          helperText: 'Type Your Name in blank',
          labelStyle: TextStyle(color: color),
          labelText: 'Password:',
          icon: Icon(
            Icons.lock,
            size: 36.0,
            color: color,
          )),
    );
  }

  Widget rePasswordForm() {
    //ประกาศตัวแปร เป็นสี
    Color color = Colors.purple;
    return TextField(
      obscureText: true,
      onChanged: (String string) {
        rePassword = string.trim();
      },
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color),
          ),
          helperStyle: TextStyle(color: color),
          helperText: 'Type Your Name in blank',
          labelStyle: TextStyle(color: color),
          labelText: 'Re Password :',
          icon: Icon(
            Icons.lock_open,
            size: 36.0,
            color: color,
          )),
    );
  }

  //กำหนดค่าตัวแปร เพื่อให้แจ้ง Message ออกมา
  Widget registerButton() {
    return IconButton(
      tooltip: 'UpLoad To Server',
      icon: Icon(Icons.settings),
      onPressed: () {
        print(
            'name =$name, user =$user, password =$password, rePassword =$rePassword');
        if (name == null ||
            name.isEmpty ||
            user == null ||
            user.isEmpty ||
            password == null ||
            password.isEmpty ||
            rePassword == null ||
            rePassword.isEmpty) {
          normalDialog(context, 'Have Space', 'Please File Every Blank');
        } else if (password == rePassword) {
          registerThread();
        } else {
          normalDialog(context, 'Password Not Math',
              'Pleese Type Password Math Re Password');
        }
      },
    );
  }

  //Call API เป็น PHP กำหนดค่าต้องใส่ $นำมา
  Future<void> registerThread() async {
    String url =
        'https://www.androidthai.in.th/feb13/addUserKrit.php?isAdd=true&Name=$name&User=$user&Password=$password';
    try {
      Response response = await Dio().get(url);
      print('reponse =$response');
      if (response.toString() == 'true') {
        Navigator.of(context).pop();
      } else {
        normalDialog(context, 'ลงทะเบียนไม่สำเร็จ', 'ลองใหม่อีกครั้ง');
      }
    } catch (e) {}
  }

  //จะห่างข้างละ 30.0
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(30.0),
        children: <Widget>[
          nameForm(),
          emailForm(),
          telephonForm(),
          passwordForm(),
          rePasswordForm(),
        ],
      ),
      appBar: AppBar(
        title: showSTitle(),
        actions: <Widget>[registerButton()],
        backgroundColor: MyStyle().textColor,
      ), //ดึงมาจาก Mystype ใส่รูป Icon เป็นก้อนเมฆ
    );
  }
}
