import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hello_world_app/controller/post_controller.dart';
import 'package:hello_world_app/model/post_model.dart';

class PostHomeScreen extends StatefulWidget {
  const PostHomeScreen({super.key});

  @override
  State<PostHomeScreen> createState() => _PostHomeScreenState();
}

class _PostHomeScreenState extends State<PostHomeScreen> {
  List<PostModel> listPosts = [];
  void getFetchData() async {
    await PostController().getPostData().then((value) {
      setState(() {
        listPosts = value;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
          itemBuilder: (context, index) => Container(
                width: double.infinity,
                height: 60,
                color: Colors.white,
                child: Text(listPosts[index].title!),
              ),
          separatorBuilder: (context, index) => const Divider(
                color: Colors.black,
              ),
          itemCount: listPosts.length),
    );
  }
}
