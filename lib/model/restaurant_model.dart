
import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantsModel{
  static const ID='id';
  static const NAME='name';
  static const AVG_PRICE='avgPrice ';
  static const RATING='rating';
  static const IMAGE='image';
  static const POPULAR='popular';
  static const RATES='rates';


  String _id;
  String _name;
  String _avgPrice;
  String _rating;
  String _image;
  bool _popular;
  int _rates;


  String get id=> _id;
  String get name=> _name;
  String get avgPrice=> _avgPrice;
  String get rating=> _rating;
  String get image=> _image;
  bool get popular=> _popular;
  int get rates => _rates;

  RestaurantsModel.fromSnapshot(DocumentSnapshot snapshot){
    _id=snapshot.data()[ID];
    _name=snapshot.data()[NAME];
    _avgPrice=snapshot.data()[AVG_PRICE];
    _rating=snapshot.data()[RATING];
    _image=snapshot.data()[IMAGE];
    _popular=snapshot.data()[POPULAR];
    _rates=snapshot.data()[RATES];

  }

}