import 'package:bloc_sample_project/feature/uplabs_page/model/popular_title_model.dart';
import 'package:http/http.dart' as http;
class PopularTitleService{
  static const _API = "https://jsonplaceholder.typicode.com/albums";

  Future<List<PopularTitleModel?>> getPopularTitle() async{
    final response = await http.get(Uri.parse(_API));
    return popularTitleModelFromJson(response.body);
  }
}