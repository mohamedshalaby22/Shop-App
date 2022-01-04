import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/categories_controller.dart';

class DetailScreen extends StatefulWidget {
  final product;
  const DetailScreen({Key? key, this.product}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 250,
          height: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(widget.product['image']))),
        ),
      ),
    );
  }
}
