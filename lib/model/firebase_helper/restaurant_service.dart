import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/model/restaurant_model.dart';

class RestaurantsService{
  String collectionPath='restaurants';
  FirebaseFirestore _firestore=FirebaseFirestore.instance;

  Future<List<RestaurantsModel>> getRestaurants() async =>_firestore.collection(collectionPath).get().then((value){
    List<RestaurantsModel> restaurants=[];
    for(DocumentSnapshot snapshot in value.docs){
      restaurants.add(RestaurantsModel.fromSnapshot(snapshot));
    }
    return restaurants;
  });

}