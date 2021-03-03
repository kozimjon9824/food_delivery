
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel{
  static const ID='id';
  static const NAME='name';
  static const IMAGE='image';
  static const RATING='rating';
  static const PRICE='price ';
  static const DESCRIPTION='description';
  static const RESTAURANT_ID='restaurantId';
  static const RESTAURANT='restaurant';
  static const CATEGORY='category';
  static const FEATURED='featured';

  String _id;
  String _name;
  String _image;
  String _rating;
  String _price;
  String _restaurantId;
  String _restaurant;
  String _category;
  bool _featured;
  String _description;


  String get id=>_id;
  String get name=>_name;
  String get image=>_image;
  String get rating=>_rating;
  String get price=>_price;
  String get restaurantId=>_restaurantId;
  String get restaurant=>_restaurant;
  String get category=>_category;
  bool get featured=>_featured;
  String get description=>_description;

  ProductModel.fromSnapshot(DocumentSnapshot snapshot){
    _id=snapshot.data()[ID];
    _name=snapshot.data()[NAME];
    _image=snapshot.data()[IMAGE];
    _rating=snapshot.data()[RATING];
    _price=snapshot.data()[PRICE];
    _restaurantId=snapshot.data()[RESTAURANT_ID];
    _restaurant=snapshot.data()[RESTAURANT];
    _category=snapshot.data()[CATEGORY];
    _featured=snapshot.data()[FEATURED];
    _description=snapshot.data()[DESCRIPTION];
  }

}