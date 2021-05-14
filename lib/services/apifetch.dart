class Album {
  final int id;
  final String question;
  dynamic option= new List<String>();

  Album({this.id, this.question, this.option});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      question: json['Question'],
      option: List.of(json['Options']),
    );
  }
}

class NameOne{
  String sn, name, address, phone;

  NameOne({
    this.sn,
    this.name,
    this.address,
    this.phone
  });
  //constructor

  factory NameOne.fromJSON(Map<String, dynamic> json){
    return NameOne(
        sn: json["sn"],
        name: json["name"],
        address: json["address"],
        phone: json["phone"]
    );
  }
}