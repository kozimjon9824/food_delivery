import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/model/usermodel.dart';

class UserService{
  String collectionPath ='users';
  FirebaseFirestore _firestore=FirebaseFirestore.instance;

  void createUser(Map<String,dynamic> user){
    var id=user['id'];
    _firestore.collection(collectionPath).doc(id).set(user);
  }

  void updateUser(Map<String,dynamic> user){
    var id=user['id'];
    _firestore.collection(collectionPath).doc(id).update(user);
  }

  Future<UserModel> getById(String id)=> _firestore.collection(collectionPath).doc(id).get().then((value) => UserModel.fromSnapshot(value));

}