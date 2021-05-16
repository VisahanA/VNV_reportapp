import 'outletclass.dart';

class report {
  final String id;
  final String due_date;
  final String purchase_date;
  Outlet outlet;

  report({this.purchase_date,this.id, this.due_date,this.outlet});

  factory report.fromJson(Map<String, dynamic> json) {
    return report(
      id: json['id'],
      purchase_date: json['purchase_date'],
      due_date:  json['due_date'],
      outlet: Outlet.fromJson(json['outlet']),
    );
  }
}


