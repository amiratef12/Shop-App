import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Features/shop_layout/presentation/manger/shop_cubit/shop_cubit.dart';
import 'package:shop_app/Features/shop_layout/presentation/manger/shop_cubit/shop_states.dart';
import 'package:shop_app/Features/shop_layout/presentation/views/widgets/build_fav_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopStates>(
      builder: (context, state) {
        var cubit = BlocProvider.of<ShopCubit>(context);
        if (state is ShopFailureGetFavoriteState) {
          return const Text('opps,there was an error ,try later');
        }
        if (cubit.getFavoritesModel!.data.data.isEmpty) {
          return const Center(
              child: Text(
            'No Favorites yet , Add favorites',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ));
        } else {
          return ListView.separated(
              itemBuilder: (context, index) {
                return BuildFavItem(
                  model: cubit.getFavoritesModel!.data.data[index].product,
                );
              },
              separatorBuilder: (context, index) {
                return Container(
                  height: 1,
                );
              },
              itemCount: cubit.getFavoritesModel!.data.data.length);
        }
      },
    );
  }
}
