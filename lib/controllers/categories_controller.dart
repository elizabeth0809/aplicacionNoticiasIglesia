import 'package:get/get.dart';
import 'package:wordpressiglesia/model/category_model.dart';

import 'package:wordpressiglesia/services/api_services.dart';

class CategoriesController extends GetxController {
  final isLoading = true.obs;
  final categoriesList = <CategoryModel>[].obs;
  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading(true);
      var categories = await APIService.fetchCategories();
      if (categories.length > 0) {
        categoriesList.clear();
        categoriesList.addAll(categories);
      }
      print(categoriesList);
    } finally {
      isLoading(false);
    }
  }
}
