import 'package:flutter/material.dart';
import 'package:food_delivery/model/food_detail.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:food_delivery/model/product_model.dart';


class DetailScreen extends StatefulWidget {
  ProductModel foodItem;

  DetailScreen(this.foodItem);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child:Column(
            children: [
              Container(
                height: 250.0,
                child: Stack(
                  children : [
                    Carousel(
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
                      Image.network(widget.foodItem.image),
                      Image.network(widget.foodItem.image),
                      Image.network(widget.foodItem.image),
                    ],
                  ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
                        Navigator.pop(context);
                      }),

                        Stack(
                          children: [
                            IconButton(icon: Icon(Icons.shopping_bag_outlined,size: 30.0,), onPressed: (){}),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(1,2),
                                        blurRadius: 3
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(10.0)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Text('5',style: TextStyle(color: Colors.red)),
                                  )),
                            )
                          ],
                        )
                    ],),
                    Positioned(
                      right: 28.0,
                      bottom: 40.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[400],
                              offset: Offset(2,1),
                              blurRadius: 3
                            )
                          ]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(Icons.favorite,color: Colors.red,size: 20),
                        ),
                      ),
                    )
                  ]
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text(widget.foodItem.name,style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.w600)),
                  Text(widget.foodItem.price.toString(),style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.w500))
                ],),
              ),
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  IconButton(icon: Icon(Icons.remove,size: 30.0,), onPressed: (){}),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 24.0),
                        child: Text('Add To Bag',style: TextStyle(color: Colors.white.withOpacity(0.8),fontWeight: FontWeight.w600,fontSize: 20.0)),
                      ),
                    ),
                  ),
                  IconButton(icon: Icon(Icons.add,color: Colors.red,size: 30.0,), onPressed: (){}),

                ],)
            ],
          )
      ),
    );
  }
}
