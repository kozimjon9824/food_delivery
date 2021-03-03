import 'package:food_delivery/model/firebase_helper/restaurant_service.dart';
import 'package:food_delivery/model/restaurant_model.dart';
import 'package:flutter/cupertino.dart';

class RestaurantsProvider with ChangeNotifier{
  RestaurantsService _service=RestaurantsService();
  List<RestaurantsModel> restaurants=[];

  RestaurantsProvider.initialize(){
    _loadRestaurants();
  }

  _loadRestaurants() async {
    restaurants=await  _service.getRestaurants();
    notifyListeners();
  }

}