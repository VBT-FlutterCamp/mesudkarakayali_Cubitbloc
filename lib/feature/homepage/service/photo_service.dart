
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../model/photo_model.dart';


class PhotoService{

  Future<List<PhotoModel>> getData()async{
   
    const API ="https://jsonplaceholder.typicode.com/photos";
    var response = await http.get(Uri.parse(API));
    var data;
    //print(data);
    if(response.statusCode==200){
     
      print("içeri girdi");
      //print(response.data[0].toString());
    
      data= photoModelFromJson(response.body);
       return data;
      
    }else{
      print("girmedi");
    }
    
   return data;

  }
}