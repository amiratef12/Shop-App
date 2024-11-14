import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Features/shop_layout/presentation/manger/shop_cubit/shop_cubit.dart';
import 'package:shop_app/Features/shop_layout/presentation/manger/shop_cubit/shop_states.dart';
import 'package:shop_app/Features/shop_layout/presentation/views/widgets/products_builder.dart';
import 'package:shop_app/core/utils/functions/show_toast.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(listener: (context, state) {
      if (state is ShopSuccessChangeFavoritesState) {
        if (!state.model.status) {
          showToast(msg: state.model.message, backgroundColor: Colors.red);
        }
      }
      if (state is ShopFailureChangeFavoritesState) {
        showToast(
            msg: 'There was an error ,try later', backgroundColor: Colors.red);
      }
    }, builder: (context, state) {
      var cubit = BlocProvider.of<ShopCubit>(context);
      if (state is ShopFailureHomeDataState) {
        return const Text(
          'There was an error ,try later',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        );
      }
      return cubit.homeModel != null && cubit.categoriesModel != null
          ? ProductsBuilder(
              categoriesModel: cubit.categoriesModel!,
              model: cubit.homeModel!,
            )
          : const Center(
              child: CircularProgressIndicator(),
            );
    });
  }
}
