import 'dart:convert';

import 'package:diz/services/post_model.dart';
import 'package:http/http.dart';

class HttpService {
  final String postUrl = "http://35.239.19.77:8000/directions/get/?cp=51355";

  Future<List<Post>> getPosts() async {
    Response res = await get(postUrl);

    if (res.statusCode == 302) {
      print("respuesta 302");
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts =
          body.map((dynamic item) => Post.fromJson(item)).toList();

      return posts;
    } else {
      print("respuesta errror");
      throw "Can't get posts";
    }
  }
}
