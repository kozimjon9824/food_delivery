import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/components/loading.dart';
import 'package:food_delivery/providers/auth_provider.dart';
import 'package:food_delivery/providers/category_provider.dart';
import 'package:food_delivery/providers/product_provider.dart';
import 'package:food_delivery/providers/restaurants_provider.dart';
import 'package:food_delivery/screens/home_screen.dart';
import 'package:food_delivery/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers:[
    ChangeNotifierProvider.value(value: AuthProvider.initialize()),
    ChangeNotifierProvider.value(value: CategoryProvider.initialize()),
    ChangeNotifierProvider.value(value: RestaurantsProvider.initialize()),
    ChangeNotifierProvider.value(value: ProductProvider.initialize())
  ],
    child: MyApp(),
  )
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red
      ),
      home:LoginScreen() ,
    );
  }
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth=Provider.of<AuthProvider>(context);
    switch(auth.status){
      case Status.Uninitialized:return Loading();
      case Status.Authenticating:
      case Status.Unauthenticated:return LoginScreen();
      case Status.Authenticated :return HomeScreen();
      default : return LoginScreen();
    }
  }
}

