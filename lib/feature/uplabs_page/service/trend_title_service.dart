import 'package:bloc_sample_project/feature/uplabs_page/model/trend_title_model.dart';
import 'package:http/http.dart' as http;
class TrendTitleService{
  static const _API = "https://jsonplaceholder.typicode.com/photos";
Future<List<TrendTitleModel>>getTrendTitle() async{
    final response = await http.get(Uri.parse(_API));
   
   return trendTitleModelFromJson(response.body);
    
   
}
}