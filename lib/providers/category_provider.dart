import 'package:food_delivery/model/firebase_helper/category_service.dart';
import 'package:food_delivery/model/category_model.dart';
import 'package:flutter/cupertino.dart';

class CategoryProvider with ChangeNotifier{
  CategoryService _categoryService=CategoryService();
  List<CategoryModel> categories=[];

  CategoryProvider.initialize(){
    _loadCategories();
  }

  _loadCategories() async {
    categories=await  _categoryService.getCategories();
    notifyListeners();
  }

}