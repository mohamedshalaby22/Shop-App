import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    Key? key,
  }) : super(key: key);

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
              image: const DecorationImage(
                  fit: BoxFit.fill, image: NetworkImage('https://th.bing.com/th/id/R.0cfe3cb86925753834d56c792931315c?rik=GA0RqPxgQyA0KA&pid=ImgRaw&r=0'))),
        ),
      ),
    );
  }
}
