import 'package:flutter/material.dart';
// import 'package:sampledemo/pages/ViewData.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'ViewData.dart';

class Homepage1 extends StatefulWidget {
  const Homepage1({Key? key}) : super(key: key);

  @override
  State<Homepage1> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage1> {


  List data = [];

  @override
  void initState() {
    super.initState();
    this.getlist();
  }
  getlist()async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var notfy_date="20210717";
    var plan_grp=prefs.getString("p_grp");
    var plan_plant=prefs.getString("p_plant");
    print(plan_plant);
    print(plan_grp);
    getPosts() async {
      // Response res = await get(Uri.parse(postsURL));
      // debugPrint(res.toString());
      final res = await http.post(
          Uri.parse("http://192.168.29.189:3000/maintenance-notfylist"),
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          body: jsonEncode({
            "data": {
              "notfy_date": notfy_date,
              "plan_group": plan_grp,
              "plan_plant": plan_plant,
            }
          }));
      print('api call worked');
      //var data = json.decode(res.body)['NOTIFICATION_LIST'][0];
      print(jsonDecode(res.body));
      if (res.statusCode == 200) {
        print('hello');
        //List<dynamic> body;
        setState(() {
          data = jsonDecode(res.body)['NOTIFICATION_LIST']['item'];
          //   List<Post> posts = body
          //       .map(
          //         (dynamic item) => Post.fromJson(item),
          //       )
          //       .toList();
        });

        return "successful";
      } else {
        throw "Unable to retrieve posts.";
      }
    }
    getPosts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:Colors.blue,
          title: Text('NOTIFICATION LIST',
          ),
          actions: [
            IconButton(icon: Icon(Icons.refresh), onPressed: () {
              // setState(() {
              this.getlist();


            },)
          ],
        ),
        body: ListView.builder(
            padding: const EdgeInsets.all(16.0),
            // ignore: unnecessary_null_comparison
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (context, index) {
              return _buildRow(data[index]);
              // return _buildRow(data[index]);
            }));
  }

  Widget _buildRow(dynamic item) {
    return Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 5,
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blueAccent,
            child: Padding(
              padding: EdgeInsets.all(6),
              child: FittedBox(
                child: Text('N'),
              ),
            ),
          ),
          title: Text(
            item['NOTIFICAT'] == null ? '' : item['NOTIFICAT'].replaceAll(new RegExp(r'^0+(?=.)'), ''),
          ),
          subtitle: Text("DESC: " + item['DESCRIPT'].toString()),
          onTap: () =>
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      ViewData(
                        NOTIFICAT: item['NOTIFICAT'].toString(),
                        NOTIF_TYPE: item['NOTIF_TYPE'].toString(),
                        // BREAKDOWN: item['BREAKDOWN'].toString(),
                        EQUIPMENT: item['EQUIPMENT'].toString(),
                        DESCRIPT: item['DESCRIPT'].toString(),
                        S_STATUS: item['S_STATUS'].toString(),
                        EQUIDESCR: item['EQUIDESCR'].toString(),
                        NOTIFDATE: item['NOTIFDATE'].toString(),
                        NOTIFTIME: item['NOTIFTIME'].toString(),
                        PRIORITY: item['PRIORITY'].toString(),
                        STARTDATE: item['STARTDATE'].toString(),
                        ENDDATE: item['ENDDATE'].toString(),
                      ),
                ),
              ),
        )
    );
  }
}