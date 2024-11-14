import 'package:flutter/material.dart';
import 'package:shop_app/Features/shop_layout/data/models/categories_model.dart';

class BuildCatItem extends StatelessWidget {
  const BuildCatItem({super.key, required this.dataModel});
  final DataModel dataModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(children: [
        Image(
          image: NetworkImage(dataModel.image),
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          dataModel.name,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        const Icon(Icons.arrow_forward_ios)
      ]),
    );
  }
}
