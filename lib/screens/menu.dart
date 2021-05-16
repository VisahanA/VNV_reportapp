import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vnv_report/screens/outlets.dart';
import 'package:vnv_report/screens/sales.dart';
import 'package:vnv_report/services/Mainclass.dart';
import 'package:http/http.dart' as http;
import 'package:json_table/json_table.dart';
import 'package:vnv_report/services/ReportResponse.dart';
import 'package:vnv_report/services/reportclass.dart';

int value=0;



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
  String title="";
  String name="";
  String due_date="";
  String purchase_date="";
  String city="";
  String mobilenumber="";
  bool toggle = true;
  bool showTable = false;
  List<dynamic> reportList;

  Future<void> fetchreport() async {
    final response = await http.get('https://vnv-cms.herokuapp.com/reports');
    final jsonresponse = json.decode(response.body);
    value=jsonresponse.length;
    if (response.statusCode == 200) {
      print(Mainreports.fromJsonString(response.body));
      processData(Mainreports.fromJsonString(response.body));
    }
    else {
      throw Exception('Failed to fetch api');
    }
  }

  void processData(Mainreports mainreports) async {
    print(mainreports.categories);
    List<report> listOfReport = mainreports.categories;
    List<ReportEntry> listOfReportEntries=new List();
    for(report r in listOfReport){
      ReportEntry reportEntry = ReportEntry(r.outlet.name, r.due_date, r.purchase_date, r.outlet.city, r.outlet.mobilenumber);
      listOfReportEntries.add(reportEntry);
    }

    ReportResponse reportresponse1=ReportResponse(listOfReportEntries);
    print(reportresponse1.convertToJsonString());
    String jsonSample = reportresponse1.convertToJsonString();
    setState(() {
      showTable = true;
      reportList = jsonDecode(jsonSample);
    });
  }

  @override
  void initState() {
    fetchreport();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Color(0xff00BCD1),
      appBar: AppBar(title: Text(title)),
      //Table
      body: Center(
        child: toggle
            ? Column(
          children: [
            if (showTable) JsonTable(
              reportList,
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
          child: Text(getPrettyJSONString(reportList)),
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

