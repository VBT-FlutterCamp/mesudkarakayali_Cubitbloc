import 'package:bloc/bloc.dart';
import 'package:bloc_sample_project/feature/homepage/model/photo_model.dart';
import 'package:bloc_sample_project/feature/homepage/service/photo_service.dart';
import 'package:meta/meta.dart';

part 'homepage_state.dart';

class HomepageCubit extends Cubit<HomepageState> {
  PhotoService _photoService = PhotoService();

  List<PhotoModel> homepagelist = [];
  bool isLoading = false;

  HomepageCubit() : super(HomepageInitial());



  void changeLoading() {
    isLoading = !isLoading;
    emit(HomePageLoadingState(isLoading));
  }

  Future fetchData() async {
    changeLoading();
    homepagelist = await _photoService.getData();
    print("0 indexin id'si" + homepagelist[0].id.toString());
    changeLoading();
  }
}

