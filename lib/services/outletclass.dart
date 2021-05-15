class Outlet {
  final String id;
  final String name;
  final String mobilenumber;
  final String city;
  final double daily_consumption;

  Outlet({this.city,this.id, this.name, this.mobilenumber,this.daily_consumption});

  factory Outlet.fromJson(Map<String, dynamic> json) {
    return Outlet(
      id: json['id'],
      name: json['name'],
      mobilenumber:  json['mobile_number'],
      city: json['city'],
      //daily_consumption: json['assumed_daily_consumption'],
    );
  }
}


