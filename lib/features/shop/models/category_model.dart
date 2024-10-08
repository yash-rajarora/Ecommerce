import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel{
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    this.parentId= '',
  });
  ///empty function
  static CategoryModel empty()=> CategoryModel(id: '', name: '', image: '', isFeatured: false);

  ///Convert to Json
  Map<String,dynamic>toJson(){
    return{
      'Name':name,
      'Image':image,
      'ParentId':parentId,
      'IsFeatured':isFeatured,
    };
  }

  ///Map Json to usermode
  factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>>document){
    if(document.data()!=null){
      final data = document.data();

      return CategoryModel(
        id: document.id,
        name: data!['Name'] ?? '',
        image: data['Image'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
        parentId: data['ParentId'] ?? '',
      );
    }
    else{
      return CategoryModel.empty();
    }
  }
}