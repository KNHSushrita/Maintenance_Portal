import 'dart:convert';

import 'package:flutter/material.dart';

import "package:http/http.dart" as http;
import 'package:maintenance_portal_knhs/WorkOrderList.dart';




void main() {
  runApp(MaterialApp(
    home: MyWorkCreate(),
  ));
}

class MyWorkCreate extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State< MyWorkCreate> {

  TextEditingController notificationtype = TextEditingController();
  TextEditingController notifno = TextEditingController();
  TextEditingController equipmentid = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController priority = TextEditingController();
  // TextEditingController reqqty = TextEditingController();
  TextEditingController ordertype = TextEditingController();
  TextEditingController oprdescription= TextEditingController();
  TextEditingController persno = TextEditingController();
  // TextEditingController normaldur = TextEditingController();
  // TextEditingController workactv = TextEditingController();
  // TextEditingController material = TextEditingController();




  //   final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  // //snackbar

  // _showSnackBar(message,color){
  //   var _snackbar = SnackBar(
  //     content: message,
  //     backgroundColor: color,
  //     );

  //     _globalKey.currentState?.showSnackBar(_snackbar);
  // }


  Future notificationSelected(dynamic str) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Work Order Created With Id $str"),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Maintenance Portal'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'WorkOrder Create',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 25),
                    )),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: notificationtype,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter notification type...',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: notifno,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter notification number...',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: ordertype,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter order type...',
                    ),
                  ),
                ),Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: equipmentid,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter equipment id...',
                    ),
                  ),
                ),Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: oprdescription,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter operation description...',
                    ),
                  ),
                ),Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: persno,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter personnel no...',
                    ),
                  ),
                ),

                // Container(
                //   padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                //   child: TextField(
                //     controller: normaldur,
                //     decoration: InputDecoration(
                //       border: OutlineInputBorder(),
                //       labelText: 'Enter normal duration...',
                //     ),
                //   ),
                // ),
                //
                //
                // Container(
                //   padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                //   child: TextField(
                //     controller: workactv,
                //     decoration: InputDecoration(
                //       border: OutlineInputBorder(),
                //       labelText: 'Enter work activity...',
                //     ),
                //   ),
                // ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: description,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter description...',
                    ),
                  ),
                ),
                // Container(
                //   padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                //   child: TextField(
                //     controller: material,
                //     decoration: InputDecoration(
                //       border: OutlineInputBorder(),
                //       labelText: 'Enter material number...',
                //     ),
                //   ),
                // ),Container(
                //   padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                //   child: TextField(
                //     controller: reqqty,
                //     decoration: InputDecoration(
                //       border: OutlineInputBorder(),
                //       labelText: 'Enter requirement quantitity... ',
                //     ),
                //   ),
                // ),

                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: priority,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter priority... ',
                    ),
                  ),
                ),


                Container(
                    height: 70,
                    padding: EdgeInsets.fromLTRB(30, 20, 30, 10),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Create',style: TextStyle(
                          fontSize: 20),),
                      onPressed: () {

                        create();
                      },
                    )),

              ],
            )));
  }

  create(){



    String notif_type = notificationtype.text;
    String notif_no = notifno.text;
    String equipid = equipmentid.text;
    String order_type = ordertype.text;
    String desc = description.text;
    String prio = priority.text;
    String opr_desc = oprdescription.text;
    String perno = persno.text;
    // String ndur = normaldur.text;
    // String wactv = workactv.text;
    // String mat = material.text;
    // String req_qty = reqqty.text;


    print('$notif_type $prio');
    //_showSnackBar(Text("Please wait while logging you in!"),Color(0xFFff670d));

    getAuth() async {
      print('inside getAuth');
      final response =
      await http.post(Uri.parse("http://192.168.29.189:3000/maintenance-wocreate"),
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          body: jsonEncode({
            "data": {"notificationtype": notif_type,
              "notifno": notif_no,
              "equipmentid": equipid,
              "ordertype": order_type ,
              "description": desc,
              "priority": prio,
              "oprdescription": opr_desc,
              "persno": perno,
              // "normaldur": ndur,
              // "workactv": wactv
              // , "material": mat,
              // "reqqty": req_qty
            }
          }));
      var auth_response = jsonDecode(response.body);
      print(auth_response);
      var notif_number = auth_response["E_MESSAGE"];
      print(notif_number);
      var newString = notif_number.substring(notif_number.length - 7);
      notificationSelected(newString);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => (HomeWpage())));
    }



    getAuth();




  }

}