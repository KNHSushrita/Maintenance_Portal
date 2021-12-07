import 'package:flutter/material.dart';
// import 'package:portal/pages/ViewData1.dart';
import 'package:http/http.dart' as http;
import 'package:maintenance_portal_knhs/ViewData1.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'ViewData1.dart';
import 'WorkOrderHome.dart';

// import 'package:portal/pages/workordercreate.dart';

class HomeWpage extends StatefulWidget {
  const HomeWpage({Key? key}) : super(key: key);

  @override
  State<HomeWpage> createState() => _HomepageState();
}

class _HomepageState extends State<HomeWpage> {
  List data = [];


  @override
  void initState() {
    super.initState();
    //this.getPosts();
  }

  Future<String> getPosts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // var notfy_date="20210717";
    var plan_grp=prefs.getString("p_grp");
    var plan_plant=prefs.getString("p_plant");
    print(plan_plant);
    print(plan_grp);


    final res =
    await http.post(Uri.parse("http://192.168.29.189:3000/maintenance-wolist"),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({
          "data": {
            "plannergroup": plan_grp,
            "planningplant": plan_plant,
          }
        }));
    print('hello');

    if (res.statusCode == 200) {
      print('hello STAUS CODE');
      setState(() {
        data = jsonDecode(res.body)['WO_LIST']['item'];
      });

      return "successful";
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => (MyApp2())));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.grey[700],
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Workorder List'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                this.getPosts;
                ;
              });
            },
          )
        ],
      ),
      body: FutureBuilder<String>(
          future: this.getPosts(),
          builder: (ctx, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  // ignore: unnecessary_null_comparison
                  itemCount: data == null ? 0 : data.length,
                  itemBuilder: (context, index) {
                    return _buildRow(data[index]);
                    // return _buildRow(data[index]);
                  });
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [CircularProgressIndicator(), Text('Loading....')],
                ),
              );
            }
          }),
    );
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
          backgroundColor: Color(0xff06bef6),
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),

            child: FittedBox(

              child: Text('W' , style: TextStyle(
                  color: Colors.white
              ),),

            ),
          ),
        ),
        title: Text(
          item['ORDERID'] == null ? '' : item['ORDERID'].replaceAll(new RegExp(r'^0+(?=.)'), ''),
          // style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          "Type: " + item['ORDER_TYPE'].toString(),
        ),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ViewData2(
              ORDERID: item['ORDERID'].replaceAll(new RegExp(r'^0+(?=.)'), '').toString(),
              ORDER_TYPE: item['ORDER_TYPE'].toString(),
              FUNCLOC: item['FUNCLOC'].toString(),
              EQUIPMENT: item['EQUIPMENT'].replaceAll(new RegExp(r'^0+(?=.)'), '').toString(),
              DESCRIPTION: item['DESCRIPTION'].toString(),
              S_STATUS: item['S_STATUS'].toString(),
              EQUIDESCR: item['EQUIDESCR'].toString(),
              WORK_CNTR: item['WORK_CNTR'].toString(),
              DURATION_NORMAL: item['DURATION_NORMAL'].toString(),
              PRIORITY: item['PRIORITY'].toString(),
              STARTDATE: item['LATE_SCHED_START_DATE'].toString(),
              ENDDATE: item['LATE_SCHED_FIN_DATE'].toString(),
            ),
          ),
        ),
      ),
    );

  }
}