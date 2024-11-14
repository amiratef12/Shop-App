import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/Features/shop_layout/data/models/categories_model.dart';
import 'package:shop_app/Features/shop_layout/data/models/shop_model.dart';
import 'package:shop_app/Features/shop_layout/presentation/views/widgets/build_category_item.dart';
import 'package:shop_app/Features/shop_layout/presentation/views/widgets/build_grid_product.dart';

class ProductsBuilder extends StatelessWidget {
  const ProductsBuilder(
      {super.key, required this.model, required this.categoriesModel});
  final HomeModel model;
  final CategoriesModel categoriesModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
              items: model.data.banners
                  .map((e) => Image(image: NetworkImage(e.image)))
                  .toList(),
              options: CarouselOptions(
                  viewportFraction: 1,
                  height: 250,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal)),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Categories',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return BuildCategoryItem(
                          dataModel: categoriesModel.data.data[index],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                      itemCount: categoriesModel.data.data.length),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'New Products',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GridView.count(
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
            childAspectRatio: 1 / 1.58,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            children: List.generate(model.data.products.length,
                (index) => BuildGridProduct(model: model.data.products[index])),
          )
        ],
      ),
    );
  }
}
