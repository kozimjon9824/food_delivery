import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/model/product_model.dart';

class ProductService{
  String collectionPath='products';
  FirebaseFirestore _firestore=FirebaseFirestore.instance;

  Future<List<ProductModel>> getProducts() async =>_firestore.collection(collectionPath).get().then((value){
    List<ProductModel> products=[];
    for(DocumentSnapshot snapshot in value.docs){
      products.add(ProductModel.fromSnapshot(snapshot));
    }
    return products;
  });

  Future<List<ProductModel>> getProductsByRestaurants(String restaurantId) async =>
      _firestore.collection(collectionPath).where('restaurantId',isEqualTo: restaurantId).get().then((value){
    List<ProductModel> products=[];
    for(DocumentSnapshot snapshot in value.docs){
      products.add(ProductModel.fromSnapshot(snapshot));
    }
    return products;
  });

  Future<List<ProductModel>> getProductsByCategory(String category) async =>
      _firestore.collection(collectionPath).where('category',isEqualTo:category).get().then((value){
        List<ProductModel> products=[];
        for(DocumentSnapshot snapshot in value.docs){
          products.add(ProductModel.fromSnapshot(snapshot));
        }
        return products;
      });

}