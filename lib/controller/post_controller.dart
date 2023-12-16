import 'package:hello_world_app/model/post_model.dart';
import 'package:http/http.dart' as http;

class PostController {
  Future getPostData() async {
    String url = 'https://jsonplaceholder.typicode.com/photos';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return postModelFromJson(response.body);
    }
    return [];
  }
}
