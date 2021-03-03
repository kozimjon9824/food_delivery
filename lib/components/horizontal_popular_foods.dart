import 'package:flutter/material.dart';
import 'package:food_delivery/model/product_model.dart';
import 'package:food_delivery/providers/product_provider.dart';
import 'package:food_delivery/screens/detail_screen.dart';
import 'package:provider/provider.dart';



class HorizontalFoods extends StatelessWidget {
  final List<ProductModel> list;


  HorizontalFoods(this.list);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 250.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen(list[index])));
            },
            child: Container(
              width: 190.0,
              padding: EdgeInsets.all(4.0),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                shadowColor: Colors.blueGrey,
                elevation: 2.0,
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(12.0),topLeft: Radius.circular(10.0)),
                        child: Image.network(list[index].image,fit: BoxFit.cover,height: 150,width: 180,)),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(list[index].name,style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.w600),),
                              IconButton(icon: Icon(list[index].featured?Icons.favorite:Icons.favorite_border,color: Colors.red,),iconSize: 18, onPressed: (){})
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text('${list[index].rating}'),
                                  Row(children: [
                                    Icon(Icons.star,color: Colors.red,size: 14.0,),
                                    Icon(Icons.star,color: Colors.red,size: 14.0,),
                                    Icon(Icons.star,color: Colors.red,size: 14.0,),
                                    Icon(Icons.star,color: Colors.red,size: 14.0,),
                                    Icon(Icons.star,color: Colors.grey,size: 14.0,)
                                  ],),
                                ],
                              ),

                              Padding(
                                padding: const EdgeInsets.only(right: 4.0),
                                child: Text('${list[index].price}',style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.w700),),
                              )
                            ],),

                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
