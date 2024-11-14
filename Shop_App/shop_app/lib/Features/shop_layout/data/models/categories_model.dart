class CategoriesModel {
  bool status;
  CategoriesDataModel data;
  CategoriesModel({required this.status, required this.data});
  factory CategoriesModel.fromJson(json) {
    return CategoriesModel(
        status: json['status'],
        data: CategoriesDataModel.fromJson(json['data']));
  }
}

class CategoriesDataModel {
  int? currentPage;
  List<DataModel> data = [];
  CategoriesDataModel.fromJson(json) {
    currentPage = json['current_page'];
    for (var element in json['data']) {
      data.add(DataModel.fromJson(element));
    }
  }
}

class DataModel {
  int id;
  String name;
  String image;
  DataModel({required this.id, required this.name, required this.image});
  factory DataModel.fromJson(json) {
    return DataModel(id: json['id'], name: json['name'], image: json['image']);
  }
}
