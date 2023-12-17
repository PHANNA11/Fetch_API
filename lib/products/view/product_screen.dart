import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hello_world_app/products/controller/product_controller.dart';
import 'package:hello_world_app/products/model/product_model.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<ProductModel> list = [];
  void getData() async {
    await ProductController().getProduct().then((value) {
      setState(() {
        list = value;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping'),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) => productCard(pro: list[index]),
      ),
    );
  }

  Widget productCard({required ProductModel pro}) {
    return ExpansionTile(
      initiallyExpanded: true,
      title: Text(pro.title),
      children: [
        Row(
          children: [
            Expanded(
              child: CachedNetworkImage(
                height: 200,
                width: 200,
                imageUrl: pro.image,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress)),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Expanded(flex: 2, child: Text(pro.description)),
          ],
        ),
      ],
    );
  }
}
