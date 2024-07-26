class User {
  String? id;
  String? phoneNumber;
  String? name;
  String? email;


  User({this.id, this.phoneNumber, this.name, this.email});

  User.fromJson(Map<String, dynamic> json) {

    id = json['id'];
    phoneNumber = json['phoneNumber'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['phoneNumber'] = phoneNumber;
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}
