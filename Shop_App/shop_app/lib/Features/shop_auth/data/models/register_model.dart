class ShopRegisterModel {
  bool status;
  String? message;
  UserData? data;
  ShopRegisterModel(
      {required this.status, required this.message, required this.data});
  factory ShopRegisterModel.fromJson(json) {
    return ShopRegisterModel(
        status: json['status'],
        message: json['message'],
        data: json['data'] == null ? null : UserData.fromJson(json['data']));
  }
}

class UserData {
  String name;
  String phone;
  String email;
  int id;
  String image;
  String token;

  UserData(
      {required this.name,
      required this.phone,
      required this.email,
      required this.id,
      required this.image,
      required this.token});
  factory UserData.fromJson(json) {
    return UserData(
        name: json['name'],
        phone: json['phone'],
        email: json['email'],
        id: json['id'],
        image: json['image'],
        token: json['token']);
  }
}
