import 'package:ecom/Utils/popup/loaders.dart';
import 'package:ecom/data/repositories/categories/category_repository.dart';
import 'package:ecom/features/shop/models/category_model.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  ///Load Category data
  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;

      final categories = await _categoryRepository.getAllCategories();

      if (categories != null) {
        allCategories.assignAll(categories);

        // Filter and assign featured categories, ensuring null safety
        featuredCategories.assignAll(
          allCategories
              .where((category) =>
          (category.isFeatured ?? false) &&
              (category.parentId?.isEmpty ?? true))
              .take(8)
              .toList(),
        );
      }
    } catch (e) {
      TLoaders.errorSnackBar(
        title: 'Oh Snap!',
        message: e.toString(),
      );
    } finally {
      isLoading.value = false;
    }
  }

}