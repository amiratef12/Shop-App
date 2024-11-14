import 'package:flutter/material.dart';
import 'package:shop_app/Features/on_boarding/data/models/boarding_model.dart';

class BuildBoardingItem extends StatelessWidget {
  const BuildBoardingItem({super.key, required this.model});
  final BoardingModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Image(
          image: AssetImage(model.image),
          fit: BoxFit.fill,
        )),
        const SizedBox(
          height: 30,
        ),
        Text(
          model.title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 45,
        ),
      ],
    );
  }
}
