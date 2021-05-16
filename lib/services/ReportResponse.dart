import 'dart:convert';
class ReportEntry {
  String name;
  String due_date;
  String purchase_date;
  String city;
  String mobilenumber;

  ReportEntry(this.name,this.due_date, this.purchase_date,this.city,this.mobilenumber);
  Map<String, dynamic> toJson() => {
    "name": name,
    "due_date":due_date,
    "purchase_date":purchase_date,
    "city":city,
    "mobilenumber":mobilenumber,
  };
}
class ReportResponse{
   List<ReportEntry> listOfReportEntries;
   ReportResponse(this.listOfReportEntries);
   String convertToJsonString() {
      return jsonEncode(this.listOfReportEntries);
   }
}


