import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vnv_report/screens/outlets.dart';
import 'package:vnv_report/screens/sales.dart';
import 'package:vnv_report/services/Mainclass.dart';
import 'package:http/http.dart' as http;
import 'package:json_table/json_table.dart';

int value=0;

Future<Mainreports> fetchreport() async {
  final response = await http.get('https://vnv-cms.herokuapp.com/reports');
  final jsonresponse = json.decode(response.body);
  value=jsonresponse.length;
  if (response.statusCode == 200) {
    print(Mainreports.fromJsonString(response.body));
    return Mainreports.fromJsonString(response.body);
  }
  else {
    throw Exception('Failed to fetch api');
  }
}

Future<Mainreports> futurereport;

class MyHomePage extends StatefulWidget {
  Function(Brightness brightness) changeTheme;
  MyHomePage({Key key, this.title})
      : super(key: key) {
    this.changeTheme = changeTheme;
  }
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title="VNV report";
  String name="BurmaBakers";
  String due_date="07-08-1998";
  String purchase_date="04-08-1998";
  String city="VNR";
  String mobilenumber="7598311776";
  bool toggle = true;

  @override
  Widget build(BuildContext context) {
    futurereport = fetchreport();
    String jsonSample = "{" + "\"" + "name" + "\":\"" + name + "\"," + "\"" + "duedate" +
        "\":\"" + due_date + "\"," + "\"" + "purchasedate" + "\":\"" +
        purchase_date + "\"," + "\"" + "mobilenumber" + "\":\"" +
        mobilenumber + "\"," + "\"" + "city" + "\":\"" + city + "\"}";
    int j=0;
    while(j<4) {
      if(j==3) {
        jsonSample="["+jsonSample+"]";
        break;
      }
      jsonSample=jsonSample+","+jsonSample;
      j++;
    }
    print(jsonSample);
    var json = jsonDecode(jsonSample);
    return Scaffold(
     // backgroundColor: Color(0xff00BCD1),
      appBar: AppBar(title: Text(title)),
      //Table
      body: Center(
        child: toggle
            ? Column(
          children: [
            JsonTable(
              json,
              showColumnToggle: true,
              allowRowHighlight: true,
              rowHighlightColor: Colors.yellow[500].withOpacity(0.7),
              paginationRowCount: 4,
              onRowSelect: (index, map) {
                print(index);
                print(map);
              },
            ),
            SizedBox(
              height: 40.0,
            ),
          ],
        )
            : Center(
          child: Text(getPrettyJSONString(jsonSample)),
        ),
      ),
      //MENU
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
              ),
              child: Text('VNV_Agro products'),
            ),
            ListTile(
              title: Text('Outlets'),
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => Outlets()));
              },
            ),
            ListTile(
              title: Text('Sales'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => Sales()));
              },
            ),
            ListTile(
              title: Text('Reports'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    CupertinoPageRoute(
                        builder: (context) => MyHomePage()));
              },
            ),
          ],
        ),
      ),
     );
  }
  String getPrettyJSONString(jsonObject) {
    JsonEncoder encoder = new JsonEncoder.withIndent('  ');
    String jsonString = encoder.convert(json.decode(jsonObject));
    return jsonString;
  }
}

