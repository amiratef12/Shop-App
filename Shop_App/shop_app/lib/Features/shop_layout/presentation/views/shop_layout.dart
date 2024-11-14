import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Features/search/presentation/views/search_view.dart';
import 'package:shop_app/Features/shop_layout/presentation/manger/shop_cubit/shop_cubit.dart';
import 'package:shop_app/Features/shop_layout/presentation/manger/shop_cubit/shop_states.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = BlocProvider.of<ShopCubit>(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text(
                'Shop',
                style: TextStyle(fontSize: 30),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const SearchView();
                      }));
                    },
                    icon: const Icon(
                      Icons.search,
                      size: 30,
                    )),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
                selectedItemColor: Colors.lightBlue,
                selectedLabelStyle: const TextStyle(fontSize: 18),
                unselectedLabelStyle: const TextStyle(fontSize: 18),
                type: BottomNavigationBarType.fixed,
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.changeBottom(index);
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      size: 35,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.apps,
                        size: 35,
                      ),
                      label: 'Categories'),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.favorite,
                        size: 35,
                      ),
                      label: 'Favorites'),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.settings,
                      size: 35,
                    ),
                    label: 'Settings',
                  ),
                ]),
            body: cubit.bottomScreens[cubit.currentIndex],
          );
        });
  }
}
