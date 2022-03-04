import 'package:bloc/bloc.dart';
import 'package:bloc_sample_project/core/strings/homepage_strings.dart';
import 'package:bloc_sample_project/feature/homepage/model/photo_model.dart';
import 'package:bloc_sample_project/feature/homepage/service/photo_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'homepage_state.dart';

class HomepageCubit extends Cubit<HomepageState> {
  PhotoService _photoService = PhotoService();

  List<PhotoModel> homepagelist = [];
  bool isLoading = false;

  HomepageCubit() : super(HomepageInitial());



  void changeLoading() {
    isLoading = !isLoading;
    print(isLoading);
    emit(HomePageLoadingState(isLoading));
  }

  Future fetchData() async {
    
    try {
      changeLoading();
      print("30.satır gelindi");
       homepagelist = await _photoService.getData();
       print("homepage lİST"+homepagelist.toString());
       
    emit(HomePageCompleted(homepagelist));
    print("0 indexin id'si" + homepagelist[0].id.toString());
    
    } catch (e) {
      emit(HomePageError("hataaaa : "+e.toString()));
      
    }
   
  }
}

