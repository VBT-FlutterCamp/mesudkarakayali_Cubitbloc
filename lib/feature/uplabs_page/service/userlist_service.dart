import 'package:bloc_sample_project/feature/uplabs_page/model/userlist_model.dart';
import 'package:vexana/vexana.dart';
import 'package:http/http.dart' as http;

class UserService{
  static const  API ="https://reqres.in/api/users?page=2";
  Future<UserModel?> getUserList()async {
      final response = await  http.get(Uri.parse(API));
      print(response.body);
    return userModelFromJson(response.body);
    }
}
