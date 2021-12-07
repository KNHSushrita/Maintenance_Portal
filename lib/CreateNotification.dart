import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import "package:http/http.dart" as http;
// import 'package:sampledemo/pages/notiflist.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:newtotolist/HomePage.dart';

import 'NotificationHome.dart';



void main() {
  runApp(MaterialApp(
    home: MyCustomForm(),
  ));
}

class MyCustomForm extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyCustomForm> {
  TextEditingController plannergroup = TextEditingController();
  TextEditingController planningplant = TextEditingController();
  TextEditingController notificationtype = TextEditingController();
  TextEditingController equipmentid = TextEditingController();
  TextEditingController funcloc = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController priority = TextEditingController();
  TextEditingController strtmalfuntiondate = TextEditingController();
  TextEditingController strtmalfuntiontime = TextEditingController();
  TextEditingController reqstartdate = TextEditingController();
  TextEditingController reqstarttime = TextEditingController();
  TextEditingController reqenddate = TextEditingController();
  TextEditingController reqendtime = TextEditingController();
  TextEditingController reportedby = TextEditingController();

  //
  // final FlutterLocalNotificationsPlugin fltrNotification = FlutterLocalNotificationsPlugin();
  //
  // @override
  // void initState() {
  //
  //   super.initState();
  //
  //   var initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
  //   var initializationSettingsIOS = IOSInitializationSettings();
  //   var initializationSettings = InitializationSettings( android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  //   fltrNotification.initialize(initializationSettings,
  //       onSelectNotification: notificationSelected).whenComplete((){
  //     setState(() {});
  //   });;
  // }
  //
  //
  //
  // Future _showNotification(String notif_no) async {
  //   var androidDetails = new AndroidNotificationDetails(
  //       "Channel ID", "Desi programmer", "This is my channel",
  //       importance: Importance.max);
  //   var iSODetails = new IOSNotificationDetails();
  //   var generalNotificationDetails =
  //   new NotificationDetails(android: androidDetails, iOS: iSODetails);
  //
  //   var scheduledTime = DateTime.now().add(Duration(seconds : 1));
  //   fltrNotification.schedule(1, "Notification created with number :", notif_no,
  //       scheduledTime, generalNotificationDetails);
  // }
  //
  //
  Future notificationSelected(dynamic payload) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Notification Created With id : $payload"),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create Notification'),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Notification Create',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    )),

                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: plannergroup,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter planner group...',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: planningplant,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter planning plant...',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: notificationtype,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter notification type...',
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
                    controller: funcloc,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter functional location...',
                    ),
                  ),
                ),Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: description,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter description...',
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: priority,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter priority...',
                    ),
                  ),
                ),


                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: reportedby,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter name of the person reported... ',
                    ),
                  ),
                ),

                Container(
                    height: 60,
                    padding: EdgeInsets.fromLTRB(30,15 , 30, 10),
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



    String planning_plant = planningplant.text;
    String plannner_group = plannergroup.text;
    String notif_type = notificationtype.text;
    String equipid = equipmentid.text;
    String func_loc = funcloc.text;
    String desc = description.text;
    String prio = priority.text;
    String smaldate = strtmalfuntiondate.text;
    String smaltime = strtmalfuntiontime.text;
    String reqsdate = reqstartdate.text;
    String reqstime = reqstarttime.text;
    String reqedate = reqenddate.text;
    String reqetime = reqendtime.text;
    String reportby = reportedby.text;

    print('$planning_plant $plannner_group');
    //_showSnackBar(Text("Please wait while logging you in!"),Color(0xFFff670d));

    getAuth() async {
      print('inside getAuth');
      final response =
      await http.post(Uri.parse("http://192.168.29.189:3000/maintenance-notfycreate"),
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          body: jsonEncode({
            "data": {
              "planningplant": planning_plant,
              "plannergroup": plannner_group
              , "notificationtype": notif_type,
              "equipmentid": equipid,
              "funcloc": func_loc
              , "description": desc,
              "priority": prio,
              "strtmalfuntiondate": smaldate,
              "strtmalfuntiontime": smaltime,
              "reqstartdate": reqsdate,
              "reqstarttime": reqstime
              , "reqenddate": reqedate,
              "reqendtime": reqetime,
              "reportedby": reportby
            }
          }));
      print('AFTER getAuth');
      print(response.body);
      print("after response");
      var auth_response = jsonDecode(response.body);
      print(auth_response);
      var notif_number = auth_response['E_NOTIFICATION_SAVE']['NOTIF_NO'];
      print("NOTFY NUMBER" +notif_number);


      notificationSelected(notif_number);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => (Homepage1())));


    }



    getAuth();




  }

}