import 'package:ecom/Utils/constants/image_strings.dart';
import 'package:ecom/features/shop/models/banner_model.dart';
import 'package:ecom/features/shop/models/category_model.dart';
import 'package:ecom/routes/routes.dart';

class TDummyData{
  static final List<BannerModel> banners = [
    BannerModel(imageUrl: TImages.banner1, targetScreen: TRoutes.order, active: false),
    BannerModel(imageUrl: TImages.banner2, targetScreen: TRoutes.cart, active: true),
    BannerModel(imageUrl: TImages.banner3, targetScreen: TRoutes.favourites, active: true),
    BannerModel(imageUrl: TImages.banner4, targetScreen: TRoutes.search, active: true),
    BannerModel(imageUrl: TImages.banner5, targetScreen: TRoutes.settings, active: true),
    BannerModel(imageUrl: TImages.banner6, targetScreen: TRoutes.userAddress, active: true),
    BannerModel(imageUrl: TImages.banner8, targetScreen: TRoutes.checkout, active: false),
  ];

  static final List<CategoryModel> categories =[
    CategoryModel(id: '1', name: 'Sports', image: TImages.sportIcon, isFeatured: true),
    CategoryModel(id: '5', name: 'Furniture', image: TImages.furnitureIcon, isFeatured: true),
    CategoryModel(id: '2', name: 'Electronics', image: TImages.electronicsIcon, isFeatured: true),
    CategoryModel(id: '3', name: 'Clothes', image: TImages.clothIcon, isFeatured: true),
    CategoryModel(id: '4', name: 'Animals', image: TImages.animalIcon, isFeatured: true),
    CategoryModel(id: '6', image: TImages.shoeIcon, name: 'Shoes', isFeatured: true),
    CategoryModel(id: '7', image: TImages.cosmeticsIcon, name: 'Cosmetics', isFeatured: true),
    CategoryModel(id: '14', image: TImages.jeweleryIcon, name: 'Jewelery', isFeatured: true),

    ///Sports Sub Categories
    CategoryModel(id: '8', image: TImages.sportIcon, name: 'Sport Shoes', parentId: '1', isFeatured: false),
    CategoryModel(id: '9', image: TImages.sportIcon, name: 'Track suits', parentId: '1', isFeatured: false),
    CategoryModel(id: '10', image: TImages.sportIcon, name: 'Sports Equipments', parentId: '1', isFeatured: false),

    ///Furniture Sub Categories
    CategoryModel(id: '11', image: TImages.furnitureIcon, name: 'Bedroom furniture', parentId: '5',isFeatured: false),
    CategoryModel(id: '12', image: TImages.furnitureIcon, name: 'Kitchen furniture', parentId: '5',isFeatured: false),
    CategoryModel(id: '13', image: TImages.furnitureIcon, name: 'Office furniture', parentId: '5',isFeatured: false),

    ///Electronics Sub categories
    CategoryModel(id: '14', image: TImages.electronicsIcon, name: 'Laptop', parentId: '2',isFeatured: false),
    CategoryModel(id: '15', image: TImages.electronicsIcon, name: 'Mobile', parentId: '2',isFeatured: false),

    ///Clothes Sub Categories
    CategoryModel(id: '16', image: TImages.clothIcon, name: 'Shirts', parentId: '3',isFeatured: false),
  ];
}