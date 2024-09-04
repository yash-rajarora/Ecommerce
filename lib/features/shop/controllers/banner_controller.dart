import 'package:ecom/Utils/popup/loaders.dart';
import 'package:ecom/data/repositories/banners/banner_repository.dart';
import 'package:ecom/features/shop/models/banner_model.dart';
import 'package:get/get.dart';

class BannerController extends GetxController{
  final carouselCurrentIndex = 0.obs;
  final isLoading = false.obs;
  final RxList<BannerModel> banners=<BannerModel>[].obs;


  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  ///update page navigation dots
  void updatePageIndicator(index){
    carouselCurrentIndex.value = index;
  }

  ///Fetch Banner
  Future<void> fetchBanners() async {
    try {
      isLoading.value = true;

      ///Fetch Banner
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      ///assign banners
      this.banners.assignAll(banners);

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