import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Features/shop_layout/presentation/manger/shop_cubit/shop_cubit.dart';
import 'package:shop_app/Features/shop_layout/presentation/manger/shop_cubit/shop_states.dart';
import 'package:shop_app/Features/shop_layout/presentation/views/widgets/build_cat_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopStates>(
      builder: (context, state) {
        var cubit = BlocProvider.of<ShopCubit>(context);
        if (state is ShopFailureCategoriesState) {
          return const Text(
            'There was an error, try later',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          );
        }
        return cubit.categoriesModel != null
            ? ListView.separated(
                itemBuilder: (context, index) {
                  return BuildCatItem(
                    dataModel: cubit.categoriesModel!.data.data[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    height: 1,
                  );
                },
                itemCount: cubit.categoriesModel!.data.data.length)
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
