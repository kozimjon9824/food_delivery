import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/model/category_model.dart';
class CategoryService{
  String collectionPath='categories';
  FirebaseFirestore _firestore=FirebaseFirestore.instance;

  Future<List<CategoryModel>> getCategories() async =>_firestore.collection(collectionPath).get().then((value){
    List<CategoryModel> categories=[];
    for(DocumentSnapshot snapshot in value.docs){
      categories.add(CategoryModel.fromSnapshot(snapshot));
    }
    return categories;
  });

}