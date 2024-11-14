import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:shop_app/Features/search/presentation/views/widgets/custom_text_field.dart';
import 'package:shop_app/Features/search/presentation/views/widgets/search_list_view.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  var formKey = GlobalKey<FormState>();

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          CustomTextField(
              onSubmit: (value) {
                BlocProvider.of<SearchCubit>(context).searchData(text: value);
              },
              controller: searchController,
              keyboardType: TextInputType.text,
              hintText: 'Search',
              prefixIcon: const Icon(Icons.search)),
          const SizedBox(
            height: 30,
          ),
          const SearchListView(),
        ],
      ),
    );
  }
}
