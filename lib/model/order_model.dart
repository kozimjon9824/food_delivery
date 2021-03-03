
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel{
  static const ID='id';
  static const PRODUCT_ID='productId';
  static const DESCRIPTION='description';
  static const AMOUNT='AMOUNT';
  static const STATUS='status';
  static const USER_ID='userId';
  static const CREATED_AT='createdAt';

  String _id;
  String _productId;
  String _userId;
  int _amount;
  String _status;
  String _description;
  int _createdAt;

  String get id=>_id;
  String get productId=>_productId;
  String get userId=>_userId;
  int get price=>_amount;
  String get status=>_status;
  String get description=>_description;
  int get createdAt=>_createdAt;

  OrderModel.fromSnapshot(DocumentSnapshot snapshot){
    _id=snapshot.data()[ID];
    _productId=snapshot.data()[PRODUCT_ID];
    _userId=snapshot.data()[USER_ID];
    _amount=snapshot.data()[AMOUNT];
    _status=snapshot.data()[STATUS];
    _description=snapshot.data()[DESCRIPTION];
    _createdAt=snapshot.data()[CREATED_AT];

  }

}