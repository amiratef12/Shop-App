class GetFavoritesModel {
  bool status;
  FavoriteDataModel data;
  GetFavoritesModel({required this.status, required this.data});
  factory GetFavoritesModel.fromJson(json) {
    return GetFavoritesModel(
        status: json['status'], data: FavoriteDataModel.fromJson(json['data']));
  }
}

class FavoriteDataModel {
  int? currentPage;
  List<DataModel> data = [];
  FavoriteDataModel.fromJson(json) {
    currentPage = json['current_page'];
    for (var element in json['data']) {
      data.add(DataModel.fromJson(element));
    }
  }
}

class DataModel {
  int id;
  ProductModel product;
  DataModel({required this.id, required this.product});
  factory DataModel.fromJson(json) {
    return DataModel(
        id: json['id'], product: ProductModel.fromJson(json['product']));
  }
}

class ProductModel {
  int id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String image;
  String name;
  String desc;
  ProductModel(
      {required this.id,
      required this.price,
      required this.oldPrice,
      required this.discount,
      required this.image,
      required this.name,
      required this.desc});
  factory ProductModel.fromJson(json) {
    return ProductModel(
        id: json['id'],
        price: json['price'],
        oldPrice: json['old_price'],
        discount: json['discount'],
        image: json['image'],
        name: json['name'],
        desc: json['description']);
  }
}
