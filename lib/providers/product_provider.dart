import 'package:food_delivery/model/firebase_helper/product_service.dart';
import 'package:food_delivery/model/product_model.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider with ChangeNotifier{

  ProductService _productService=ProductService();
  List<ProductModel> products = [];
  List<ProductModel> productsByCategory = [];
  List<ProductModel> productsByRestaurant = [];

  ProductProvider.initialize(){
    _loadProduct();
  }

  _loadProduct() async {
    products=await  _productService.getProducts();
    notifyListeners();
  }

  Future loadProductByCategory(String category) async {
    productsByCategory=await  _productService.getProductsByCategory(category);
    notifyListeners();
  }

  Future loadProductByRestaurant(String restaurant) async {
    products=await  _productService.getProductsByRestaurants(restaurant);
    notifyListeners();
  }

}