import 'package:shop_app/Features/search/data/models/search_model/search_model.dart';

abstract class SearchStates {}

class SearchInitialState extends SearchStates {}

class SearchLoadingState extends SearchStates {}

class SearchSuccessState extends SearchStates {
  final SearchModel searchModel;

  SearchSuccessState({required this.searchModel});
}

class SearchFailureState extends SearchStates {
  final String errMessage;

  SearchFailureState({required this.errMessage});
}
