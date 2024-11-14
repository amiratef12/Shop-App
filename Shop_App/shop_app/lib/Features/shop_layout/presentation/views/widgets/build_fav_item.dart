import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Features/shop_layout/data/models/get_favorites_model.dart';
import 'package:shop_app/Features/shop_layout/presentation/manger/shop_cubit/shop_cubit.dart';

class BuildFavItem extends StatelessWidget {
  const BuildFavItem({super.key, required this.model});
  final ProductModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(
                    model.image,
                  ),
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                ),
                if (model.discount != 0)
                  Container(
                    color: Colors.red,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        'DISCOUNT',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  )
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          height: 1.3),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          '${model.price}' r'$',
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlue),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        if (model.discount != 0)
                          Text(
                            '${model.oldPrice}' r'$',
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough),
                          ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              BlocProvider.of<ShopCubit>(context)
                                  .changeFavorites(model.id);
                            },
                            icon: CircleAvatar(
                              backgroundColor:
                                  BlocProvider.of<ShopCubit>(context)
                                          .favorites[model.id]!
                                      ? Colors.blue
                                      : Colors.grey,
                              radius: 15,
                              child: const Icon(
                                Icons.favorite_border,
                                size: 14,
                                color: Colors.white,
                              ),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
