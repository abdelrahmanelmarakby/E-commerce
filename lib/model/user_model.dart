class UserModel {
  String userid;
  String name;
  String email;
  String pic;

  UserModel({this.userid, this.name, this.email, this.pic});

  UserModel.fromJson(Map<String, dynamic> json) {
    userid = json['userid'];
    name = json['name'];
    email = json['email'];
    pic = json['pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userid'] = this.userid;
    data['name'] = this.name;
    data['email'] = this.email;
    data['pic'] = this.pic;
    return data;
  }
}
