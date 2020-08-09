
class Post {
  int userId,id;
  String title,body;

  Post(this.userId, this.id, this.title, this.body);
  Post.fromJson(Map<String,dynamic> jsonObject){
    this.userId = jsonObject['userId'];
    this.id = jsonObject['id'];
    this.title = jsonObject['title'];
    this.body = jsonObject['body'];
  }
}