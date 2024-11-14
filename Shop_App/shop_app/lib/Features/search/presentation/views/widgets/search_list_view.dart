import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:shop_app/Features/search/presentation/manager/search_cubit/search_state.dart';
import 'package:shop_app/Features/search/presentation/views/widgets/build_search_item.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchStates>(builder: (context, state) {
      if (state is SearchLoadingState) {
        return const LinearProgressIndicator();
      } else if (state is SearchSuccessState) {
        final searchData = state.searchModel.data?.data;
        if (searchData != null && searchData.isNotEmpty) {
          return Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return BuildSearchItem(
                    model: state.searchModel.data!.data![index],
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    height: 1,
                  );
                },
                itemCount: state.searchModel.data!.data!.length),
          );
        } else {
          return const Center(
              child: Text(
            'No Results Found',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ));
        }
      } else if (state is SearchFailureState) {
        return Center(
            child: Text(state.errMessage,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 25)));
      }
      return const Center(
          child: Text(
        "Search For Items",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      ));
    });
  }
}
