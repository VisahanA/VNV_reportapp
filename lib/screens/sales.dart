import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'menu.dart';
import 'outlets.dart';

class  Sales extends StatefulWidget {
  Function(Brightness brightness) changeTheme;
  Sales({Key key, this.title})
      : super(key: key) {
    this.changeTheme = changeTheme;
  }

  final String title;

  @override
  _SalesState createState() => _SalesState();
}

class _SalesState extends State<Sales> {
  final outletname = TextEditingController();
  final quantity = TextEditingController();
  final purchaseddate= TextEditingController();
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'Sales',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sales'),
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
                      child:DropdownButton<String>(
                        value: dropdownValue,
                        style: TextStyle(
                            color: Colors.black54,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        //DropdownChanges
                        items: <String>['One', 'Two', 'three', 'Four'].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )
                    ),
                    Container(
                      width: 280,
                      padding: EdgeInsets.all(10.0),
                      child:TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Quantity',
                        ),
                        controller: quantity,
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
                          labelText: 'PurchasedDate',
                        ),
                        controller: purchaseddate,
                        textInputAction: TextInputAction.go,
                        keyboardType: TextInputType.datetime,
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
                          outletname.clear();
                          purchaseddate.clear();
                          quantity.clear();
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