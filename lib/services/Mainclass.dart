import 'dart:convert';
import 'package:vnv_report/services/reportclass.dart';

class Mainreports {
  Mainreports(this.categories);

  List<report> categories;

  Mainreports.fromJsonString(String jsonArray) {
    this.categories = (json.decode(jsonArray) as List).map((i) => report.fromJson(i)).toList();
  }
}