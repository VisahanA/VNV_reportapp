import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vnv_report/screens/outlets.dart';
import 'package:vnv_report/screens/sales.dart';
import 'package:vnv_report/services/apifetch.dart';
import 'package:http/http.dart' as http;
import 'package:vnv_report/services/theme.dart';

int i=0;
int index=0;

Future<Album>   fetchAlbum(int i) async {
  final response = await http.get('https://visahan.tk/disc.json');
  final jsonresponse = json.decode(response.body);
  if (response.statusCode == 200) {
    print(jsonresponse[i]['Question']);
    return Album.fromJson(jsonresponse[i]);
  }
  else {
    throw Exception('Failed to fetch api');
  }
}

Future<Album> futureAlbum;
Set<int> setOfInts = Set();


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
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    while(index<9) {
      futureAlbum = fetchAlbum(index);
      index++;
    }

    return Scaffold(
     // backgroundColor: Color(0xff00BCD1),
      appBar: AppBar(title: Text(title)),
      //Table
      body: Center(
        child: Column(children: <Widget>[
        Container(
        margin: EdgeInsets.all(20),
        child: Table(
          defaultColumnWidth: FixedColumnWidth(120),
          border: TableBorder.all(
              color: Colors.black,
              style: BorderStyle.solid,
              width: 2
          ),
          children: [
            TableRow( children: [
            Column(
                children:[
                  Text('Outlet',
                      style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold)
                  )
                ]
            ),
              Column(
                  children:[
                    Text('Purchase_date',
                        style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold)
                    )
                  ]
              ),
              Column(
                  children:[
                    Text('Due_date',
                        style: TextStyle(fontSize: 16.0,
                            fontWeight: FontWeight.bold)
                    )
                  ]
              ),
            ]),
        TableRow( children: [
          Column(
              children:[ Container(
                padding: const EdgeInsets.all(10.0),
                child: FutureBuilder<Album>(
                  future: futureAlbum,
                  builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        futureAlbum = fetchAlbum(index);
                        return Text(snapshot.data.option[1],
                            style: TextStyle(color: Colors.black, fontSize: 14));
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                    return CircularProgressIndicator();
                  },
                ),
              ),
              ]
          ),
          Column(
              children:[ Container(
                padding: const EdgeInsets.all(10.0),
                child: FutureBuilder<Album>(
                  future: futureAlbum,
                  builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(snapshot.data.option[2],
                            style: TextStyle(color: Colors.black, fontSize: 14));
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                    return CircularProgressIndicator();
                  },
                ),
              ),
              ]
          ),
          Column(
              children:[ Container(
                padding: const EdgeInsets.all(10.0),
                child: FutureBuilder<Album>(
                  future: futureAlbum,
                  builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(snapshot.data.option[3],
                            style: TextStyle(color: Colors.black, fontSize: 14));
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                    return CircularProgressIndicator();
                  },
                ),
              ),
              ]
          ),
        ]),
            TableRow( children: [
              Column(
                  children:[ Container(
                    padding: const EdgeInsets.all(10.0),
                    child: FutureBuilder<Album>(
                      future: futureAlbum,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          futureAlbum = fetchAlbum(index);
                          return Text(snapshot.data.option[1],
                              style: TextStyle(color: Colors.black, fontSize: 14));
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return CircularProgressIndicator();
                      },
                    ),
                  ),
                  ]
              ),
              Column(
                  children:[ Container(
                    padding: const EdgeInsets.all(10.0),
                    child: FutureBuilder<Album>(
                      future: futureAlbum,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(snapshot.data.option[2],
                              style: TextStyle(color: Colors.black, fontSize: 14));
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return CircularProgressIndicator();
                      },
                    ),
                  ),
                  ]
              ),
              Column(
                  children:[ Container(
                    padding: const EdgeInsets.all(10.0),
                    child: FutureBuilder<Album>(
                      future: futureAlbum,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(snapshot.data.option[3],
                              style: TextStyle(color: Colors.black, fontSize: 14));
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return CircularProgressIndicator();
                      },
                    ),
                  ),
                  ]
              ),
            ]),
            //Tablerow $$$$
          ],
        ),
      ),
      ])
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
}

