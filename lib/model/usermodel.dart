import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  static const NAME='name';
  static const EMAIL='email';
  static const ID='id';
  static const LIKED_FOOD='likedFood';
  static const LIKED_RESTAURANTS='likedRestaurants';

  String _email;
  String _name;
  String _id;
  List _likedFood;
  List _likedRestaurants;

  String get name => _name;
  String get email => _email;
  String get id => _id;
  List get likedFood => _likedFood;
  List get likedRestaurants => _likedRestaurants;

  UserModel.fromSnapshot(DocumentSnapshot snapshot){
    _name=snapshot.data()[NAME];
    _email=snapshot.data()[EMAIL];
    _id=snapshot.data()[ID];
    _likedFood=snapshot.data()[LIKED_FOOD]??[];
    _likedRestaurants=snapshot.data()[LIKED_RESTAURANTS]??[];
    
  }

}