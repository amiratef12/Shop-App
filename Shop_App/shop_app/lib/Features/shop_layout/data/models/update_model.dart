class ShopUpdateModel {
  bool status;
  String? message;
  UserData? data;
  ShopUpdateModel(
      {required this.status, required this.message, required this.data});
  factory ShopUpdateModel.fromJson(json) {
    return ShopUpdateModel(
        status: json['status'],
        message: json['message'],
        data: json['data'] == null ? null : UserData.fromJson(json['data']));
  }
}

class UserData {
  int id;
  String name;
  String email;
  String phone;
  String image;
  int points;
  int credit;
  String token;

  UserData(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.image,
      required this.points,
      required this.credit,
      required this.token});
  factory UserData.fromJson(json) {
    return UserData(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        image: json['image'],
        points: json['points'],
        credit: json['credit'],
        token: json['token']);
  }
}
