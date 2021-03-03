
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/model/restaurant_model.dart';
import 'package:food_delivery/providers/product_provider.dart';
import 'package:provider/provider.dart';

class RestaurantScreen extends StatefulWidget {
  final RestaurantsModel restaurantsModel;


  RestaurantScreen(this.restaurantsModel);

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {

  @override
  Widget build(BuildContext context) {
    final foodProvider=Provider.of<ProductProvider>(context);
    foodProvider.loadProductByRestaurant(widget.restaurantsModel.id);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 220.0,
              child: Carousel(
                borderRadius: true,
                boxFit: BoxFit.cover,
                autoplay: false,
                animationCurve: Curves.fastOutSlowIn,
                animationDuration: Duration(milliseconds: 2000),
                dotSize: 7.0,
                dotIncreaseSize: 1.3,
                dotIncreasedColor: Color(0xFFFF335C),
                dotBgColor: Colors.white,
                dotPosition: DotPosition.bottomCenter,
                dotVerticalPadding: 10.0,
                dotColor: Colors.grey,
                showIndicator: true,
                indicatorBgPadding: 6.0,
                images: [
                  Image.network(foodProvider.productsByRestaurant[0].image),
                  Image.network(foodProvider.productsByRestaurant[0].image),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: foodProvider.productsByRestaurant.length,
                  itemBuilder: (context,index){
                    return Container(
                      padding: EdgeInsets.all(6.0),
                      height: 160.0,
                      child: Card(
                        shadowColor: Colors.blueGrey,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)
                        ),
                        child:Row(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(12.0),bottomLeft: Radius.circular(12.0)),
                                child: Image.network(foodProvider.productsByRestaurant[index].image,height: 160.0,width: 150.0,)),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(foodProvider.productsByRestaurant[index].name,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16.0),),
                                      Icon(Icons.favorite_border,color: Colors.red,size: 18.0,)
                                    ],),


                                  Text('from: '+foodProvider.productsByRestaurant[index].restaurant),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(children: [
                                        Text(foodProvider.productsByRestaurant[index].rating.toString()),
                                        Icon(Icons.star,color: Colors.red,size: 14.0,),
                                        Icon(Icons.star,color: Colors.red,size: 14.0,),
                                        Icon(Icons.star,color: Colors.red,size: 14.0,),
                                        Icon(Icons.star,color: Colors.red,size: 14.0,),
                                      ],),

                                      Text(foodProvider.productsByRestaurant[index].price.toString(),
                                        style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.w400),)
                                    ],
                                  )
                                ],),
                            )
                          ],
                        ) ,
                      ),
                    );
                  }),
            )


          ],
        ),
      ),
    );
  }
}
