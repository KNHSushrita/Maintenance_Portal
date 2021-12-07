import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ViewData2 extends StatefulWidget {
  String ORDERID;
  String ORDER_TYPE;
  String FUNCLOC;
  String EQUIPMENT;
  String DESCRIPTION;
  String S_STATUS;

  String EQUIDESCR;
  String DURATION_NORMAL;
  String WORK_CNTR;
  String PRIORITY;
  String STARTDATE;
  String ENDDATE;

  //const ViewData({Key? key, }) : super(key: key);

  ViewData2(
      {
        required this.ORDERID,
        required this.ORDER_TYPE,
        required this.FUNCLOC,
        required this.EQUIPMENT,
        required this.DESCRIPTION,
        required this.S_STATUS,
        required this.EQUIDESCR,
        required this.DURATION_NORMAL,
        required this.WORK_CNTR,
        required this.PRIORITY,
        required this.STARTDATE,
        required this.ENDDATE});

  @override
  State<ViewData2> createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData2> {
  bool edit = false;
  String NOTIFICAT = "";
  String NOTIF_TYPE = "";
  String LOCATION = "";
  String STARTDATE = "";
  String ENDDATE = "";
  String EQUIPMENT = "";
  String DESCRIPTION = "";
  String PRIORITY = "";
  String DURATION_NORMAL = "";

  GlobalKey<FormState> key = GlobalKey<FormState>();

  // final FlutterLocalNotificationsPlugin fltrNotification =
  // FlutterLocalNotificationsPlugin();
  // @override
  // void initState() {
  //   super.initState();
  //
  //   var initializationSettingsAndroid =
  //   AndroidInitializationSettings('app_icon');
  //   var initializationSettingsIOS = IOSInitializationSettings();
  //   var initializationSettings = InitializationSettings(
  //       android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  //   fltrNotification
  //       .initialize(initializationSettings,
  //       onSelectNotification: notificationSelected)
  //       .whenComplete(() {
  //     setState(() {});
  //   });
  //   ;
  // }
  //
  // Future notificationSelected(dynamic payload) async {
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       content: Text("Notification : $payload"),
  //     ),
  //   );
  // }
  //
  // Future _showNotification(String notif_no) async {
  //   var androidDetails = new AndroidNotificationDetails(
  //       "Channel ID", "Desi programmer", "This is my channel",
  //       importance: Importance.max);
  //   var iSODetails = new IOSNotificationDetails();
  //   var generalNotificationDetails =
  //   new NotificationDetails(android: androidDetails, iOS: iSODetails);
  //
  //   var scheduledTime = DateTime.now().add(Duration(seconds: 1));
  //   fltrNotification.schedule(1, "Notification updated for :", notif_no,
  //       scheduledTime, generalNotificationDetails);
  // }

  void save() async {
    // if (key.currentState!.validate()) {
    //   // TODo : showing any kind of alert that new changes have been saved
    //   await widget.ref.update(
    //     {'title': title, 'description': des},
    //   );
    //   Navigator.of(context).pop(context);
    // }

    // final response =
    //     await http.post(Uri.parse("http://192.168.0.8:3000/matnwoidupdate"),
    final response =
    await http.post(Uri.parse("http://192.168.29.189:3000/maintenance-woedit"),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({
          "orderid": widget.ORDERID,
          // "ordertype": widget.ORDER_TYPE,
          "notifno": "",
          // "notificationtype": "",
          "equipment": EQUIPMENT,
          "description": DESCRIPTION,
          "priority": PRIORITY,
          // "persno": "",
          "workact": DURATION_NORMAL,
          // "reserve": "",
          // "description": "",
          // "reqqty": ""
        }));
    var auth_response = jsonDecode(response.body);
    print(auth_response);
    var notif_number = auth_response["E_MESSAGE"];
    print(notif_number);

    // _showNotification(notif_number);

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
          backgroundColor: Colors.blue,
          title: Text('Workorder Details'),
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
                          title: new Text('OrderId',
                              style: new TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue,
                                  fontSize: 20.0)),
                          subtitle: TextFormField(
                            initialValue: widget.ORDERID,
                            enabled: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        ListTile(
                          title: new Text('Order Type',
                              style: new TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue,
                                  fontSize: 20.0)),
                          subtitle: TextFormField(
                            initialValue: widget.ORDER_TYPE,
                            enabled: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        ListTile(
                          title: new Text('Functional Location',
                              style: new TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue,
                                  fontSize: 20.0)),
                          subtitle: TextFormField(
                            initialValue: widget.FUNCLOC,
                            enabled: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        ListTile(
                          title: new Text('Equipment Id',
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
                          title: new Text('Description',
                              style: new TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue,
                                  fontSize: 20.0)),
                          subtitle: TextFormField(
                            onChanged: (_val) {
                              DESCRIPTION = _val;
                            },
                            initialValue: widget.DESCRIPTION,
                            enabled: edit,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        ListTile(
                          title: new Text('Work Center',
                              style: new TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue,
                                  fontSize: 20.0)),
                          subtitle: TextFormField(
                            initialValue: widget.WORK_CNTR,
                            enabled: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        ListTile(
                          title: new Text('Normal Duration',
                              style: new TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue,
                                  fontSize: 20.0)),
                          subtitle: TextFormField(
                            onChanged: (_val) {
                              PRIORITY = _val;
                            },
                            initialValue: widget.DURATION_NORMAL,
                            enabled: edit,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        ListTile(
                          title: new Text('Priority',
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
                          title: new Text('Equipment Description',
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
                          title: new Text('Status',
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
                          title: new Text('Start Date',
                              style: new TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue,
                                  fontSize: 20.0)),
                          subtitle: TextFormField(
                            onChanged: (_val) {
                              STARTDATE = _val;
                            },
                            initialValue: widget.STARTDATE,
                            enabled: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        ListTile(
                          title: new Text('End Date',
                              style: new TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue,
                                  fontSize: 20.0)),
                          subtitle: TextFormField(
                            onChanged: (_val) {
                              ENDDATE = _val;
                            },
                            initialValue: widget.ENDDATE,
                            enabled: false,
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

                //test form

                // Form(
                //   key: key,
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       TextFormField(
                //         decoration: InputDecoration.collapsed(
                //           hintText: "Title",
                //         ),
                //         style: TextStyle(
                //           fontSize: 32.0,
                //           fontFamily: "lato",
                //           fontWeight: FontWeight.bold,
                //           color: Colors.grey,
                //         ),
                //         initialValue: widget.NOTIFICAT,
                //         enabled: edit,
                //         onChanged: (_val) {
                //           NOTIFICAT = _val;
                //         },
                //         validator: (_val) {
                //           if (_val!.isEmpty) {
                //             return "Can't be empty !";
                //           } else {
                //             return null;
                //           }
                //         },
                //       ),
                //       //
                //       Padding(
                //         padding: const EdgeInsets.only(
                //           top: 12.0,
                //           bottom: 12.0,
                //         ),
                //         child: Text(
                //           widget.NOTIFTIME,
                //           style: TextStyle(
                //             fontSize: 20.0,
                //             fontFamily: "lato",
                //             color: Colors.grey,
                //           ),
                //         ),
                //       ),

                //       //

                //       TextFormField(
                //         decoration: InputDecoration.collapsed(
                //           hintText: "Note Description",
                //         ),
                //         style: TextStyle(
                //           fontSize: 20.0,
                //           fontFamily: "lato",
                //           color: Colors.grey,
                //         ),
                //         initialValue: widget.NOTIF_TYPE,
                //         enabled: edit,
                //         onChanged: (_val) {
                //           NOTIF_TYPE = _val;
                //         },
                //         maxLines: 20,
                //         validator: (_val) {
                //           if (_val!.isEmpty) {
                //             return "Can't be empty !";
                //           } else {
                //             return null;
                //           }
                //         },
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ));
  }
}