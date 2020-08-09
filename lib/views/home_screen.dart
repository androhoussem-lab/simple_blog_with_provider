import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/models/post_model.dart';
import 'package:provider_app/providers/post_provider.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Post> posts ;
  getData()async{
    posts = await Provider.of<PostProvider>(context,listen: false).fetchData();
    Provider.of<PostProvider>(context,listen: false).setPosts(posts);
  }
  @override
  void initState(){
  // print(Provider.of<PostProvider>(context,listen: false).getPosts()[0].title.toUpperCase());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider app'),
        centerTitle: true,
      ),
      body: (! Provider.of<PostProvider>(context).loading)?ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount:Provider.of<PostProvider>(context).getListLength(),
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(
                Provider.of<PostProvider>(context).getPosts()[index].title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text( Provider.of<PostProvider>(context).getPosts()[index].body),
            );
          }):Center(child: CircularProgressIndicator(),),
    );


  }

}
