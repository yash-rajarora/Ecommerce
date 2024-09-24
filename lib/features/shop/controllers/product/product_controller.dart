import 'package:ecom/Utils/constants/enums.dart';
import 'package:ecom/Utils/popup/loaders.dart';
import 'package:ecom/data/repositories/product/product_repository.dart';
import 'package:ecom/features/shop/models/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  final productRepository = Get.put(ProductRepository());
  final isLoading = false.obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try{
      isLoading.value = true;

      /// Fetch products
      final products = await productRepository.getFeaturedProducts();

      ///Assign Products
      featuredProducts.assignAll(products);
    } catch(e){
      TLoaders.errorSnackBar(title: 'Oh Snap!' , message: e.toString());
    } finally{
      isLoading.value = false;
    }
  }
  ///Get price range for variations
  String getProductPrice(ProductModel product){
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    if(product.productType == ProductType.single.toString()){
      return (product.salePrice > 0 ? product.salePrice : product.price).toString();
    } else{
      for(var variation in product.productVariations!){
        double priceToConsider = variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        if(priceToConsider < smallestPrice){
          smallestPrice = priceToConsider;
        }
        if(priceToConsider > largestPrice){
          largestPrice = priceToConsider;
        }
      }
      if(smallestPrice.isEqual(largestPrice)){
        return largestPrice.toString();
      } else{
        return '$smallestPrice - \$$largestPrice';
      }
    }


  }

  ///Discount Percentage
  String? calculateSalePercentage(double originalPrice, double? salePrice){
    if(salePrice == null || salePrice <= 0.0) return null;
    if(originalPrice <- 0) return null;

    double percetage = ((originalPrice-salePrice)/originalPrice)*100;
    return percetage.toStringAsFixed(0);
  }

  ///Stock Status
  String getProductStockStatus(int stock){
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}
