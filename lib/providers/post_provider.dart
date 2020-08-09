import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:provider_app/api/api_utilities.dart';
import 'package:provider_app/models/post_model.dart';

class PostProvider extends ChangeNotifier{
  bool loading = true;
  List<Post> _posts = [];

  setPosts(List<Post> value) {
    this._posts = value;
    loading = false;
    notifyListeners();
  }
  List<Post> getPosts(){
    print( 'LENGTH OF LIST :' + this._posts.length.toString() );
    return  this._posts;
  }

  Future<List<Post>> fetchData()async{
    List<Post> posts;
    http.Response response = await http.get(ApiUtilities.MAIN_URL);
    if(response.statusCode == 200){
      posts = (json.decode(response.body) as List).map((i) =>
          Post.fromJson(i)).toList();
      return posts;
     // Post post = Post.fromJson(data);
    }else{
      throw('error fetching data');
    }

  }

  int getListLength(){

    return this._posts.length;
  }

}