class HomeModel {
  bool status;
  ShopDataModel data;
  HomeModel({required this.status, required this.data});
  factory HomeModel.fromJson(json) {
    return HomeModel(
        status: json['status'], data: ShopDataModel.fromJson(json['data']));
  }
}

class ShopDataModel {
  List<BannerModel> banners = [];
  List<ProductsModel> products = [];
  ShopDataModel.fromJson(json) {
    if (json['banners'] != null) {
      for (var element in json['banners']) {
        banners.add(BannerModel.fromJson(element));
      }
    }
    if (json['products'] != null) {
      for (var element in json['products']) {
        products.add(ProductsModel.fromJson(element));
      }
    }
  }
}

class BannerModel {
  int id;
  String image;
  BannerModel({required this.id, required this.image});
  factory BannerModel.fromJson(json) {
    return BannerModel(id: json['id'], image: json['image']);
  }
}

class ProductsModel {
  int id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String image;
  String name;
  bool inFavorites;
  bool inCart;
  ProductsModel(
      {required this.id,
      required this.price,
      required this.oldPrice,
      required this.discount,
      required this.image,
      required this.name,
      required this.inFavorites,
      required this.inCart});
  factory ProductsModel.fromJson(json) {
    return ProductsModel(
        id: json['id'],
        price: json['price'],
        oldPrice: json['old_price'],
        discount: json['discount'],
        image: json['image'],
        name: json['name'],
        inFavorites: json['in_favorites'],
        inCart: json['in_cart']);
  }
}
