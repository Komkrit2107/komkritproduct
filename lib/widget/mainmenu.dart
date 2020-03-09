//import 'package:dio/dio.dart'
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kritproduct/utility/models/user_model.dart';
import 'package:kritproduct/utility/my_style.dart';
//import 'package:http/http.dart' as http;
//import 'package:kritproduct/url_launcher.dart/url_launcher.dart';
//import 'package:kritproduct/widget/funtype.dart';
//import 'package:kritproduct/widget/menu_sub2.dart';

class Menus extends StatefulWidget {
  //ต้องการส่งค่า
  final UserModel userModel;
  Menus({Key key, this.userModel}) : super(key: key);

  @override
  _MenusState createState() => _MenusState();
}

class _MenusState extends State<Menus> {
  //Field
  String nameLogin = '';
  UserModel currentModel;
  String name, user, password, rePassword, telephone, idno;
  String idfund, fundDresscription;

  //Method
  @override
  void initState() {
    super.initState();
    currentModel = widget.userModel;
    nameLogin = currentModel.name;
    // launch = _MenusState.;
  }

  Widget mySizebox() {
    return SizedBox(
      width: 10.0,
      height: 20.0,
    );
  }

  Widget mySpacce() {
    return SizedBox(
      width: 10.0,
      height: 5.0,
    );
  }

  Widget showTitle() {
    return Text(
      'เมนู / Menu',
      style: TextStyle(
        fontFamily: 'RobotoMono', //Raleway
        fontSize: 25.0,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
        color: MyStyle().colorWhite,
      ),
    );
  }

  Widget show2Logo() {
    return Container(
      height: 40.0,
      child: Image.asset('images/logo12.png'),
    );
  }

  Widget menuApps() {
    return OutlineButton(
        onPressed: (){},
        child: Stack(
          children: <Widget>[       
            Align(alignment: Alignment.topLeft, child: Icon(Icons.graphic_eq)),
            Align(
                alignment: Alignment(0.0, -0.1),
                child: Text(
                  "Holding Statment For Your",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    fontSize: 16.0,
                    color: MyStyle().blue900,
                  ),
                ))
          ],
        ),
        highlightedBorderColor: MyStyle().colorGrey3,
        color: MyStyle().colorGrey9,
        borderSide: new BorderSide(color: MyStyle().colorGrey4),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(50.0)));
  }

  Widget menuMail() {
    return OutlineButton(
        onPressed: (){}, //webContract,
        child: Stack(
          children: <Widget>[
            Align(alignment: Alignment.centerLeft, child: Icon(Icons.email)),
            Align(
                alignment: Alignment.center,
                child: Text(
                  "Emai:marketing@wealthrepublic.co.th",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    fontSize: 16.0,
                    color: MyStyle().blue900,
                  ),
                ))
          ],
        ),
        highlightedBorderColor: Colors.orange,
        color: Colors.green,
        borderSide: new BorderSide(color: MyStyle().colorGrey4),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(50.0)));
  }

  Widget menuLine() {
    return OutlineButton(
        onPressed: () {}, //webContract,
        child: Stack(
          children: <Widget>[
            Align(alignment: Alignment.centerLeft, child: Icon(Icons.people)),
            Align(
                alignment: Alignment.center,
                child: Text(
                  "Line@:@wealthrepublic",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    fontSize: 16.0,
                    color: MyStyle().blue900,
                  ),
                ))
          ],
        ),
        highlightedBorderColor: MyStyle().colorGrey4,
        color: Colors.green,
        borderSide: new BorderSide(color: MyStyle().colorGrey4),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(50.0)));
  }

  Widget menuWebsite() {
    return OutlineButton(
        onPressed:(){}, //webCompany,
        child: Stack(
          children: <Widget>[
            Align(alignment: Alignment.bottomLeft, child: Icon(Icons.web)),
            Align(
                alignment: Alignment.center,
                child: Text(
                  "Website:wealthrepublic.co.th",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    fontSize: 16.0,
                    color: MyStyle().blue900,
                  ),
                ))
          ],
        ),
        highlightedBorderColor: MyStyle().colorGrey4,
        color: Colors.green,
        borderSide: new BorderSide(color: MyStyle().colorGrey4),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(50.0)));
  }

  Widget menuFacebook() {
    return OutlineButton(
        onPressed:(){}, //webFacebook,
        child: Stack(
          children: <Widget>[
            Align(
                alignment: Alignment.centerLeft,
                child: Icon(Icons.people_outline)),
            Align(
                alignment: Alignment.center,
                child: Text(
                  "Facebook",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    fontSize: 16.0,
                    color: MyStyle().blue900,
                  ),
                ))
          ],
        ),
        highlightedBorderColor: MyStyle().colorGrey4,
        color: Colors.green,
        borderSide: new BorderSide(color: MyStyle().colorGrey4),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(50.0)));
  }

  Widget menuContract() {
    return OutlineButton(
        onPressed: () {} ,//=> launch("tel://022666697"), //webContract,

        child: Stack(
          children: <Widget>[
            Align(alignment: Alignment.centerLeft, child: Icon(Icons.phone)),
            Align(
                alignment: Alignment.center,
                child: Text(
                  "เบอร์ติดต่อ : 02 266 6697-8",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    fontSize: 16.0,
                    color: MyStyle().blue900,
                  ),
                ))
          ],
        ),
        highlightedBorderColor: MyStyle().colorGrey4,
        color: Colors.green,
        borderSide: new BorderSide(color: MyStyle().colorGrey4),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(50.0)));
  }

  Widget menuMessase() {
    return OutlineButton(
        onPressed:(){}, //webNews,
        child: Stack(
          children: <Widget>[
            Align(
                alignment: Alignment.bottomLeft,
                child: Icon(
                  Icons.money_off,
                  color: MyStyle().color8,
                )),
            Align(
                alignment: Alignment.center,
                child: Text(
                  "ข่าวสารการลงทุน Wealthrepublic",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    fontSize: 16.0,
                    color: MyStyle().blue900,
                  ),
                ))
          ],
        ),
        highlightedBorderColor: MyStyle().colorGrey4,
        color: Colors.green,
        borderSide: new BorderSide(color: MyStyle().colorGrey4),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(50.0)));
  }

  Widget menuMarketing() {
    return OutlineButton( 
           onPressed: funmenu,

        child: Stack(
          children: <Widget>[
            Align(
                alignment: Alignment.bottomLeft,
                child: Icon(
                  Icons.nature_people,
                  color: MyStyle().color8,
                )),
            Align(
                alignment: Alignment.center,
                child: Text(
                  "Marketing For Agent / สำหรับตัวแทน",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    fontSize: 16.0,
                    color: MyStyle().blue900,
                  ),
                ))
          ],
        ),
        highlightedBorderColor: MyStyle().colorGrey4,
        color: Colors.green,
        borderSide: new BorderSide(color: MyStyle().colorGrey4),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(50.0)));
  }


 Widget indexMarketing() {
    return OutlineButton( 
           onPressed: (){}, // setindex,

        child: Stack(
          children: <Widget>[
            Align(
                alignment: Alignment.bottomLeft,
                child: Icon(
                  Icons.nature_people,
                  color: MyStyle().color8,
                )),
            Align(
                alignment: Alignment.center,
                child: Text(
                  "ตลาดหลักทรัพย์แห่งประเทศไทย",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    fontSize: 16.0,
                    color: MyStyle().blue900,
                  ),
                ))
          ],
        ),
        highlightedBorderColor: MyStyle().colorGrey4,
        color: Colors.green,
        borderSide: new BorderSide(color: MyStyle().colorGrey4),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(50.0)));
  }




  //call programe type onPress โดยใช้ onPress
  Future<void> funmenu() async  {
             
            MaterialPageRoute materialPageRoute =
                MaterialPageRoute(builder: (BuildContext buildContext) {
              //return Menusub2();
            });
                Navigator.of(context).push(materialPageRoute);
   

  }


 
  // webApps() async {
  //   const url = 'https://m.wealthrepublic.co.th';

  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     // iOS
  //     const url = 'https://m.wealthrepublic.co.th';
  //     if (await canLaunch(url)) {
  //       await launch(url);
  //     } else {
  //       throw 'Could not launch $url';
  //     }
  //   }
  // }

//---------------เว็บ บริษัท
  // webCompany() async {
  //   const url = 'http://wealthrepublic.co.th';

  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     // iOS
  //     const url = 'http://wealthrepublic.co.th';
  //     if (await canLaunch(url)) {
  //       await launch(url);
  //     } else {
  //       throw 'Could not launch $url';
  //     }
  //   }
  // }

  // webContract() async {
  //   const url = 'http://wealthrepublic.co.th/contact.html';

  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     // iOS
  //     const url = 'http://wealthrepublic.co.th/contact.html';
  //     if (await canLaunch(url)) {
  //       await launch(url);
  //     } else {
  //       throw 'Could not launch $url';
  //     }
  //   }
  // }

  // webFacebook() async {
  //   const url = 'https://www.facebook.com/wealthrepublic';

  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     // iOS
  //     const url = 'https://www.facebook.com/wealthrepublic';
  //     if (await canLaunch(url)) {
  //       await launch(url);
  //     } else {
  //       throw 'Could not launch $url';
  //     }
  //   }
  // }

  // webNews() async {
  //   const url = 'http://wealthrepublic.co.th/news.html';

  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     // iOS
  //     const url = 'http://wealthrepublic.co.th/news.html';
  //     if (await canLaunch(url)) {
  //       await launch(url);
  //     } else {
  //       throw 'Could not launch $url';
  //     }
  //   }
  // }

  // setindex() async {
  //   const url = 'https://marketdata.set.or.th/mkt/sectorialindices.do?language=th&country=TH';

  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     // iOS
  //     const url = 'https://marketdata.set.or.th/mkt/sectorialindices.do?language=th&country=TH';
  //     if (await canLaunch(url)) {
  //       await launch(url);
  //     } else {
  //       throw 'Could not launch $url';
  //     }
  //   }
  // }

 

  //แสดงชื่อให้อยู่ในบรรทัดเดียวกัน
  Widget showName() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('$nameLogin'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(14.0),
        children: <Widget>[
          show2Logo(),
          mySpacce(),
          mySpacce(),
          menuApps(),
          mySpacce(),
          menuMessase(),
          mySpacce(),
          menuWebsite(),
          mySpacce(),
          menuLine(),
          mySpacce(),
          menuFacebook(),
          mySpacce(),
          menuContract(),
          mySpacce(),
          menuMail(),
          mySpacce(),
          menuMarketing(),
          mySpacce(),
          indexMarketing(),
        ],
      ),
      backgroundColor: MyStyle().colorWhite,
      appBar: AppBar(
        actions: <Widget>[showName()],
        title: showTitle(),
        backgroundColor: MyStyle().colorGrey6,
      ),
    );
  }
}
