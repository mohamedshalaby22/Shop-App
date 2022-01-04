import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/categories_controller.dart';

import 'package:flutter_application_1/main.dart';

import 'package:flutter_application_1/view/cart_screen.dart';
import 'package:flutter_application_1/view/detail_screen.dart';

import 'package:flutter_application_1/view/splash_screen.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  CategoriesController categoriesController = CategoriesController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: Obx(() {
          if (categoriesController.loading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          if (categoriesController.categories.isEmpty) {
            return const Center(child: Text("No categories found"));
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildCategoriesRow(),
                Expanded(
                  child: Obx(
                    () {
                      if (productsController.loading.value) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (productsController.products.isEmpty) {
                        return const Center(child: Text("No products found"));
                      } else {
                        return _buildProductsList();
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        }));
  }

  ListView _buildProductsList() {
    return ListView.builder(
      itemCount: productsController.products.length,
      padding: const EdgeInsets.only(top: 16),
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailScreen(
                        product: productsController.products[index],
                      )));
        },
        child: Card(
          elevation: 0.0,
          child: Container(
            height: 120,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: [
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          productsController.products[index]["image"]),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productsController.products[index]["title"],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Expanded(
                          child: Text(
                            productsController.products[index]["description"],
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          "\$${productsController.products[index]["price"]}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _buildCategoriesRow() {
    return Container(
      height: 35.0,
      margin: const EdgeInsets.only(top: 16),
      child: ListView.builder(
          itemCount: categoriesController.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Obx(
                () => InkWell(
                  onTap: () {
                    categoriesController.changeCategories(index);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: index == categoriesController.currentIndex.value
                          ? Colors.black87
                          : Colors.transparent,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      categoriesController.categories[index],
                      style: TextStyle(
                        color: index == categoriesController.currentIndex.value
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              )),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      elevation: 0,
      title: const Text(
        "ShopY",
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        IconButton(
            onPressed: () {
              authController.logout();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const SplashScreen()),
              );
            },
            icon: const Icon(Icons.logout_outlined)),
        IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CartPage(),
              ));
            },
            icon: const Icon(Icons.add_shopping_cart)),
      ],
    );
  }
}
