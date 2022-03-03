import 'package:dio/dio.dart';

import '../model/photo_model.dart';

class PhotoService{

  Future getData()async{
    var response = await Dio().get("https://jsonplaceholder.typicode.com/photos");
    return PhotoModel.fromJson(response.data[0]);

  }
}