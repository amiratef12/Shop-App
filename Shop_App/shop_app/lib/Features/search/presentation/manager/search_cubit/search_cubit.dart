import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Features/search/data/models/search_model/search_model.dart';
import 'package:shop_app/Features/search/presentation/manager/search_cubit/search_state.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/core/utils/api_service.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());
  SearchModel? searchModel;
  void searchData({required String text}) {
    emit(SearchLoadingState());
    ApiService(Dio())
        .post(endPoint: kSearch, body: {'text': text}, token: token)
        .then((value) {
      searchModel = SearchModel.fromJson(value.data);
      emit(SearchSuccessState(searchModel: searchModel!));
    }).catchError((error) {
      emit(SearchFailureState(errMessage: error.toString()));
    });
  }
}
