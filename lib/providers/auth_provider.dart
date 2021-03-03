import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'file:///H:/FlutterPro/food_delivery/food_delivery/lib/model/firebase_helper/user_service.dart';
import 'package:food_delivery/model/usermodel.dart';

enum Status{Uninitialized, Unauthenticated,Authenticating,Authenticated}

class AuthProvider with ChangeNotifier{
  FirebaseAuth _auth;
  User _user;
  Status _status=Status.Uninitialized;
  UserService _userService=UserService();
  UserModel _model;

  User get user=> _user;
  Status get status=> _status;
  UserModel get userModel=>_model;

  final formKey=GlobalKey<FormState>();

  TextEditingController nameCont=TextEditingController();
  TextEditingController emailCont=TextEditingController();
  TextEditingController passwordCont=TextEditingController();

  AuthProvider.initialize():_auth=FirebaseAuth.instance{
    _auth.authStateChanges().listen(_onStateChanged);
  }

  Future<void> _onStateChanged(User user) async {
    if(user==null){
      _status=Status.Uninitialized;
    }else{
      _user=user;
      _status=Status.Authenticated;
      _model=await _userService.getById(user.uid);
    }
    notifyListeners();
  }

  Future<bool> signIn() async {
    try{
      _status=Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(email: emailCont.text, password: passwordCont.text);
      return true;
    }catch(e){
     return onErr(e.toString());
    }
  }

  
  Future<bool> signUp() async {
    try{
      _status=Status.Authenticating;
      notifyListeners();
      await _auth.createUserWithEmailAndPassword(email: emailCont.text.trim(), password: passwordCont.text.trim()).then((user){
       Map<String, dynamic > value={
         'name':nameCont.text,
      'email':emailCont.text,
      'id':user.user.uid};
       _userService.createUser(value);
      });
      return true;
    }catch(e){
      return onErr(e.toString());
    }
  }

  Future signOut(){
    _auth.signOut();
    _status=Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  bool onErr(String e){
    _status=Status.Unauthenticated;
    notifyListeners();
    print('error' + e.toString());
    return false;
  }

  void clearController(){
    nameCont.text = "";
    passwordCont.text = "";
    emailCont.text = "" ;
  }

}