import 'package:bloc/bloc.dart';
import 'package:bloc_sample_project/feature/uplabs_page/model/popular_title_model.dart';
import 'package:bloc_sample_project/feature/uplabs_page/model/trend_title_model.dart';
import 'package:bloc_sample_project/feature/uplabs_page/model/userlist_model.dart';
import 'package:bloc_sample_project/feature/uplabs_page/service/popular_title_service.dart';
import 'package:bloc_sample_project/feature/uplabs_page/service/trend_title_service.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

import '../../service/userlist_service.dart';

part 'uplabsview_state.dart';

class UplabsviewCubit extends Cubit<UplabsviewState> {
  UplabsviewCubit() : super(UplabsviewLoading()) {
    _init();
  }

  UserModel? userList;
  List<TrendTitleModel?> trendingList = [];
  List<PopularTitleModel?> popularList = [];

  int selectedIndex = 0;

  bool isLoading = false;

  UserService _userService = UserService();
  TrendTitleService _trendTitleService = TrendTitleService();
  PopularTitleService _popularTitleService = PopularTitleService();

  Future<void> _init() async {
    await fetchUplabsViewData();

    emit(UplabsviewCompleted(userList, trendingList, popularList));
  }

  void changeLoading() {
    isLoading = !isLoading;
    print(isLoading);
  }

  Future<void> fetchUplabsViewData() async {
    changeLoading();
    userList = await _userService.getUserList();
    trendingList = await _trendTitleService.getTrendTitle();
    popularList = await _popularTitleService.getPopularTitle();
    changeLoading();
  }
}
