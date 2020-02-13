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



  //Method
  @override
  void initState(){
    super.initState();
    currentModel = widget.userModel;
    nameLogin = currentModel.name;
  }

  Widget showTitle(){
    return Text('Product');
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
      appBar: AppBar(actions: <Widget>[showName()],
        title: showTitle(),
        backgroundColor: MyStyle().textColor,),
    );
  }
}
