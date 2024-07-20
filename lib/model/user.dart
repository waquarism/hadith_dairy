class User {
  String? phoneNumber;
  String? name;


  User({this.phoneNumber, this.name});

  User.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phoneNumber'] = phoneNumber;
    data['name'] = name;
    return data;
  }
}
