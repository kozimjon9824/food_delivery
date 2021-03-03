

import 'package:flutter/material.dart';
import 'package:food_delivery/components/horizontal_category.dart';
import 'package:food_delivery/components/horizontal_popular_foods.dart';
import 'package:food_delivery/model/restaurant_model.dart';
import 'package:food_delivery/providers/auth_provider.dart';
import 'package:food_delivery/providers/product_provider.dart';
import 'package:food_delivery/providers/restaurants_provider.dart';
import 'package:food_delivery/screens/restaurant_screen.dart';
import 'package:food_delivery/screens/shopping_bag.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final authProvider=Provider.of<AuthProvider>(context);
    final res=Provider.of<RestaurantsProvider>(context);
    final productProvider=Provider.of<ProductProvider>(context);


    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text('FoodApp',style: TextStyle(fontSize: 18.0),),
        actions: [
          Stack(
              children:[
                IconButton(icon: Icon(Icons.shopping_cart_outlined), onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyShoppingBag()));
                }),
                Positioned(
                  top: 12.0,
                  right: 12.0,
                  child: Container(
                    height: 10.0,
                    width: 10.0,
                    decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.red
                    ) ,
                  ),
                )
              ]),
          Stack(
              children:[
                IconButton(icon: Icon(Icons.notifications_none), onPressed: (){}),
                Positioned(
                  top: 12.0,
                  right: 12.0,
                  child: Container(
                    height: 10.0,
                    width: 10.0,
                    decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.red
                    ) ,
                  ),
                )
              ]),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.red),
                accountName:Text(authProvider.userModel.name,style: TextStyle(color: Colors.white),) ,
                accountEmail:Text(authProvider.userModel.email,style: TextStyle(color: Colors.white),)),
            ListTile(
              onTap: (){},
              leading: Icon(Icons.home),
              title: Text('Home'),
            )
          ],
        ),
      ),

      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[400],
                          offset: Offset(1, 1),
                          blurRadius: 4
                      ),
                    ]
                ),

                child: ListTile(
                  leading: Icon(Icons.search_outlined,color: Colors.red),
                  title: TextField(
                    style: TextStyle(fontSize: 16.0),
                    decoration: InputDecoration(
                        hintText: 'find a food & restaurant',hintStyle: TextStyle(color: Colors.grey),border: InputBorder.none),
                  ),
                  trailing: Icon(Icons.filter_list,color: Colors.red),
                ),
              ),
            ),

            HorizontalCategory(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Popular foods',style: TextStyle(color:Colors.black.withOpacity(0.5),fontSize: 18.0),),
            ),

            HorizontalFoods(productProvider.products),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Popular Restaurants',style: TextStyle(color:Colors.black.withOpacity(0.5),fontSize: 18.0),),
            ),


            SingleChildScrollView(
              child: Column(
                children:res.restaurants.map((item) => Container(
                  child:  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>RestaurantScreen(item)));
                      },
                      child: RestaurantWidget(item))
                  ,
                )).toList() ),
            ),

          ],
        ),
      )
    );
  }
}


//widgwt
class RestaurantWidget extends StatelessWidget {
  final RestaurantsModel item;

  RestaurantWidget(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical:4.0,horizontal: 6.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
        height: 240.0,
        child:Stack(
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(20.0) ,
                child: Image.network(item.image,height: 300.0,width:double.infinity ,fit: BoxFit.cover,)),
            Container(
              decoration: BoxDecoration(color: Colors.black26,borderRadius: BorderRadius.circular(20.0),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.6),
                      Colors.black.withOpacity(0.6),
                      Colors.black.withOpacity(0.6),
                      Colors.black.withOpacity(0.4),
                      Colors.black.withOpacity(0.1),
                      Colors.black.withOpacity(0.05),
                      Colors.black.withOpacity(0.025),
                    ],
                  )
              )
              ,),

            Positioned.fill(
              top: 4.0,
                right: 4.0,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Icon(
                              Icons.star,
                              color: Colors.yellow[900],
                              size: 20,
                            ),
                          ),
                          Text(item.rating.toString()),
                        ],
                      ),
                    ),
                  ),
                )),

            Positioned.fill(
                bottom: 30,
                left: 10.0,
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(item.name, style: TextStyle(color: Colors.white,fontSize: 24.0,fontWeight: FontWeight.w500),))
            ),

            Positioned.fill(
                bottom: 10,
                left: 10,
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(item.avgPrice.toString()??'99.9', style: TextStyle(color: Colors.white,fontSize: 18.0),))
            ),

          ],

        ) );
  }
}
