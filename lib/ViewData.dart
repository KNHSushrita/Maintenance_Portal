// ignore_for_file: must_be_immutable


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
//   NOTIFICAT: '000010010737',
//   NOTIF_TYPE: 'B1',
//   FUNCLOC: '',                     x
//   EQUIPMENT: '000000000010000007', x
//   DESCRIPT: 'test',                 x
//   S_STATUS: 'OSNO',
//   EQUIDESCR: 'Truck - Al Latifia',
//   NOTIFDATE: '2021-07-13',
//   NOTIFTIME: '17:10:59',
//   PRIORITY: 1,                     x
//   STARTDATE: '2021-07-13',         x
//   ENDDATE: '2021-07-14',           x

class ViewData extends StatefulWidget {

  String NOTIFICAT;
  String NOTIF_TYPE;
  String EQUIPMENT;
  String DESCRIPT;
  String S_STATUS;

  String EQUIDESCR;
  String NOTIFDATE;
  String NOTIFTIME;
  String PRIORITY;
  String STARTDATE;
  String ENDDATE;

  //const ViewData({Key? key, }) : super(key: key);

  ViewData(
      {required this.NOTIFICAT,
        required this.NOTIF_TYPE,
        required this.EQUIPMENT,
        required this.DESCRIPT,
        required this.S_STATUS,
        required this.EQUIDESCR,
        required this.NOTIFDATE,
        required this.NOTIFTIME,
        required this.PRIORITY,
        required this.STARTDATE,
        required this.ENDDATE});

  @override
  State<ViewData> createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData> {

  bool edit = false;
  String NOTIFICAT = "";
  String NOTIF_TYPE = "";
  String LOCATION = "";
  String EQUIPMENT = "";
  String DESCRIPT = "";
  String PRIORITY = "";
  String STARTDATE = "";
  String ENDDATE = "";

  GlobalKey<FormState> key = GlobalKey<FormState>();


  void save() async {
    // if (key.currentState!.validate()) {
    //   // TODo : showing any kind of alert that new changes have been saved
    //   await widget.ref.update(
    //     {'title': title, 'description': des},
    //   );
    //   Navigator.of(context).pop(context);
    // }

    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? planningplant = prefs.getString("p_plant");
    String? planner_group = prefs.getString("p_grp");
    print('shared resource');
    print(planningplant);
    print(planner_group);

    final response =
    await http.post(Uri.parse("http://192.168.29.189:3000/maintenance-notfyedit"),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({

          "planningplant": planningplant,
          "plannergroup": planner_group,
          "notifno": widget.NOTIFICAT,
          "equipmentid": EQUIPMENT,
          "description": DESCRIPT,
          "priority": PRIORITY,
          "reqstartdate": STARTDATE,
          "reqstarttime": "",
          "reqenddate": ENDDATE,
          "reqendtime": "",
          "reportedby": ""
        }));
    print('api called');
    print(response);
    var auth_response = jsonDecode(response.body);
    print(auth_response);
    var notif_number = auth_response["NOTIFICATION_NUMBER"];
    print(notif_number);


    if (response.statusCode == 200) {
      Navigator.of(context).pop(context);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: edit
            ? FloatingActionButton(
          onPressed: save,
          child: Icon(
            Icons.save_rounded,
            color: Colors.white,
          ),
          backgroundColor: Colors.grey[700],
        )
            : null,
        appBar: AppBar(
          backgroundColor:Colors.blue,
          title: Text('Notification Details'),
          actions: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                setState(() {
                  edit = !edit;
                });
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Card(
                  child: Form(
                    key: key,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        ListTile(
                          title:  new Text('Notification No',
                              style: new TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue,
                                  fontSize: 20.0)),

                          subtitle: TextFormField(
                            onChanged: (_val) {
                              NOTIFICAT = _val;
                            },
                            initialValue: widget.NOTIFICAT,
                            enabled: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),

                        ListTile(
                          title:  new Text('Notification Type',
                              style: new TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue,
                                  fontSize: 20.0)),
                          subtitle: TextFormField(
                            onChanged: (_val) {
                              NOTIFICAT = _val;
                            },
                            initialValue: widget.NOTIF_TYPE,
                            enabled: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),

                        ListTile(
                          title:  new Text('Equipment Id',
                              style: new TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue,
                                  fontSize: 20.0)),
                          subtitle: TextFormField(
                            onChanged: (_val) {
                              EQUIPMENT = _val;
                            },
                            initialValue: widget.EQUIPMENT,
                            enabled: edit,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),

                        ListTile(
                          title:  new Text('Description',
                              style: new TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue,
                                  fontSize: 20.0)),
                          subtitle: TextFormField(
                            onChanged: (_val) {
                              DESCRIPT = _val;
                            },
                            initialValue: widget.DESCRIPT,
                            enabled: edit,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),

                        ListTile(
                          title:  new Text('Created on',
                              style: new TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue,
                                  fontSize: 20.0)),
                          subtitle: TextFormField(
                            initialValue: widget.NOTIFDATE,
                            enabled: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),

                        ListTile(
                          title:  new Text('Created time',
                              style: new TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue,
                                  fontSize: 20.0)),
                          subtitle: TextFormField(
                            initialValue: widget.NOTIFTIME,
                            enabled: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),

                        ListTile(
                          title:  new Text('Priority',
                              style: new TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue,
                                  fontSize: 20.0)),
                          subtitle: TextFormField(
                            onChanged: (_val) {
                              PRIORITY = _val;
                            },
                            initialValue: widget.PRIORITY,
                            enabled: edit,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),


                        ListTile(
                          title:  new Text('Equipment Description',
                              style: new TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue,
                                  fontSize: 20.0)),
                          subtitle: TextFormField(

                            initialValue: widget.EQUIDESCR,
                            enabled: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),

                        ListTile(
                          title:  new Text('Status',
                              style: new TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue,
                                  fontSize: 20.0)),
                          subtitle: TextFormField(
                            initialValue: widget.S_STATUS,
                            enabled: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),

                        ListTile(
                          title:  new Text('Start Date',
                              style: new TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue,
                                  fontSize: 20.0)),
                          subtitle: TextFormField(
                            onChanged: (_val) {
                              STARTDATE = _val;
                            },
                            initialValue: widget.STARTDATE,
                            enabled: edit,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),

                        ListTile(
                          title:  new Text('End Date',
                              style: new TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue,
                                  fontSize: 20.0)),
                          subtitle: TextFormField(
                            onChanged: (_val) {
                              ENDDATE = _val;
                            },
                            initialValue: widget.ENDDATE,
                            enabled: edit,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),



                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),


              ],
            ),
          ),
        ));

  }

}
