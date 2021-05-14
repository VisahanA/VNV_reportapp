import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vnv_report/screens/sales.dart';

import 'menu.dart';

class Outlets extends StatelessWidget {
  final myController = TextEditingController();
  final name = TextEditingController();
  final mobilenumber = TextEditingController();
  final city = TextEditingController();
  final dailyconsumption =TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'Outlets',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Outlets'),
        ),
        body: Center(
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.white),
            child: SingleChildScrollView(
            child: Column(
                children:[
                  Container(
                    width: 280,
                    padding: EdgeInsets.all(10.0),
                    child:TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Outlet name',
                      ),
                      controller: name,
                      textInputAction: TextInputAction.go,
                      keyboardType: TextInputType.name,
                    ),
                ),
                  Container(
                    width: 280,
                    padding: EdgeInsets.all(10.0),
                    child:TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Mobilenumber',
                      ),
                      controller: mobilenumber,
                      textInputAction: TextInputAction.go,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Container(
                    width: 280,
                    padding: EdgeInsets.all(10.0),
                    child:TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Daily Consumption rate',
                      ),
                      controller: dailyconsumption,
                      textInputAction: TextInputAction.go,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Container(
                    width: 280,
                    padding: EdgeInsets.all(10.0),
                    child:TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'City',
                      ),
                      controller: city,
                      textInputAction: TextInputAction.go,
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(25),
                    child: FlatButton(
                      child: Text('Save', style: TextStyle(fontSize: 20.0),),
                      color: Colors.blueAccent,
                      textColor: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(25),
                    child: FlatButton(
                      child: Text('Reset', style: TextStyle(fontSize: 20.0),),
                      color: Colors.blueAccent,
                      textColor: Colors.white,
                      onPressed: () {
                        name.clear();
                        mobilenumber.clear();
                        city.clear();
                        dailyconsumption.clear();
                      },
                    ),
                  ),
                ]
              ),
           ),
          ),
         ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                ),
                child: Text('VNV_Agro food products'),
              ),
              ListTile(
                title: Text('Outlets'),
                onTap: () {
                  Navigator.pop(context);
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
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => MyHomePage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}