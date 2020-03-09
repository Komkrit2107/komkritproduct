import 'package:flutter/material.dart';
import 'package:kritproduct/utility/models/user_model.dart';
import 'package:kritproduct/utility/my_style.dart';

class ListProduct extends StatefulWidget {
 //ต้องการส่งค่า
 final UserModel userModel;
 ListProduct({Key key,this.userModel}):super(key:key);


  @override
  _ListProductState createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {

  //Field
  String nameLogin = '';
  UserModel currentModel;
  String name, user, password, rePassword;



  //Method
  @override
  void initState(){
    super.initState();
    currentModel = widget.userModel;
    nameLogin = currentModel.name;
  }

  Widget showTitle(){
    return Text('SmartFund Link');
  }

 Widget fundForm() {
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
          helperText: 'Pleses Select Fund',
          labelStyle: TextStyle(color: color),
          labelText: 'Fund Type',
          icon: Icon(
            Icons.mail_outline,
            size: 36.0,
            color: color,
          )),
    );
  }




  //ต้องการให้อยู่บรรทัดเดียวกัน
  Widget showName(){
    return Column(mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('$nameLogin'),
      ],
    ) ;
  }


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: ListView(
        padding: EdgeInsets.all(30.0),
        children: <Widget>[
        fundForm(),  
        ],
      ),
      appBar: AppBar(actions: <Widget>[showName()],
        title: showTitle(),
        backgroundColor: MyStyle().textColor,),
    );
  }
}
