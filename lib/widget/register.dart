import 'package:flutter/material.dart';
import 'package:kritproduct/utility/my_style.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //Field

  //Method กำหนดรูปคน และกำหนดค่าสี
  Widget nameForm() {
    //ประกาศตัวแปร เป็นสี
    Color color = Colors.purple;
    return TextField(
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color),
          ),
          helperStyle: TextStyle(color: color),
          helperText: 'Type Your Name in blank',
          labelStyle: TextStyle(color: color),
          labelText: 'Display Name:',
          icon: Icon(
            Icons.person,
            size: 36.0,
            color: color,
          )),
    );
  }

  Widget registerButton() {
    return IconButton(
      tooltip: 'UpLoad To Server',
      icon: Icon(Icons.cloud_download),
      onPressed: () {},
    );
  }

  //จะห่างข้างละ 30.0
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(30.0),
        children: <Widget>[
          nameForm(),
        ],
      ),
      appBar: AppBar(
        actions: <Widget>[registerButton()],
        backgroundColor: MyStyle().textColor,
      ), //ดึงมาจาก Mystype ใส่รูป Icon เป็นก้อนเมฆ
    );
  }
}
