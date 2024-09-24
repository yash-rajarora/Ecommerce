import 'package:ecom/features/shop/controllers/product/images_controller.dart';
import 'package:ecom/features/shop/models/product_model.dart';
import 'package:ecom/features/shop/models/product_variation_model.dart';
import 'package:get/get.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  RxMap<String, dynamic> selectedAttributes = <String, dynamic>{}.obs;
  RxString variationsStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;

  ///Select attribute
  void onAttributeSelected(ProductModel product, String attributeName, dynamic attributeValue) {
    // Directly update the observable map
    selectedAttributes[attributeName] = attributeValue;

    // Find the matching variation based on selected attributes
    final variation = product.productVariations!.firstWhere(
          (variation) => _isSameAttributeValues(variation.attributeValues, selectedAttributes),
      orElse: () => ProductVariationModel.empty(),
    );

    // Update the selected image if variation has a specific image
    if (variation.image.isNotEmpty) {
      ImagesController.instance.selectedProductImage.value = variation.image;
    }

    // Update the selected variation
    selectedVariation.value = variation;

    // Update the stock status
    getProductVariationStockStatus();
  }

  bool _isSameAttributeValues(Map<String, dynamic> variationAttributes, Map<String, dynamic> selectedAttributes) {
    if (variationAttributes.length != selectedAttributes.length) return false;
    for (final key in variationAttributes.keys) {
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }
    return true;
  }

  /// Check available attributes in stock
  Set<String?> getAttributesAvailabilityInVariation(List<ProductVariationModel> variations, String attributeName) {
    final availableVariationAttributeValues = variations
        .where((variation) => variation.attributeValues[attributeName] != null && variation.attributeValues[attributeName]!.isNotEmpty && variation.stock > 0)
        .map((variation) => variation.attributeValues[attributeName])
        .toSet();
    return availableVariationAttributeValues;
  }

  /// Get the price of the selected variation
  String getVariationPrice() {
    return (selectedVariation.value.salePrice > 0 ? selectedVariation.value.salePrice : selectedVariation.value.price).toString();
  }

  /// Check variation stock status
  void getProductVariationStockStatus() {
    variationsStockStatus.value = selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  /// Reset selected attributes
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationsStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }
}

