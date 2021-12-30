import 'package:flutter_application_1/controller/product_controller.dart';
import 'package:flutter_application_1/reposority/category_reposority.dart';

import 'package:get/get.dart';


ProductsController productsController = ProductsController();

class CategoriesController extends GetxController {
  CategoriesRepository categoriesRepository = CategoriesRepository();
  var categories = [].obs;
  var currentIndex = 0.obs;
  var loading = false.obs;

  CategoriesController() {
    loadCategories();
  }

  loadCategories() async {
    loading(true);
    var tcategories = await categoriesRepository.loadCategoriesFromApi();
    categories(tcategories);
    if (categories.isNotEmpty) {
      await productsController
          .loadProductsFromRepo(categories[currentIndex.value]);
    }
    loading(false);
  }

  changeCategories(index) async {
    currentIndex(index);
    await productsController.loadProductsFromRepo(categories[index]);
  }
}
