import 'package:flutter/material.dart';
import 'package:food_delivery/providers/category_provider.dart';
import 'package:food_delivery/screens/category_screen.dart';
import 'package:provider/provider.dart';


class HorizontalCategory extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final categoryProvider=Provider.of<CategoryProvider>(context);

    return Container(
      height: 60.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount:categoryProvider.categories.length,
          itemBuilder:(builder,index) {
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryScreen(categoryProvider.categories[index])));
              },
              child: Container(
                padding: EdgeInsets.all(4.0),
                width: 110.0,
                height: 60.0,
                child: Stack(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(categoryProvider.categories[index].image,height: 60.0,width: 110.0,fit: BoxFit.cover)),
                    Container(
                      alignment: Alignment.center,
                      width: 110.0,
                      height: 60.0,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: Colors.black38),
                      child: Text(categoryProvider.categories[index].name,style: TextStyle(color: Colors.white,fontSize: 16.0)),
                    )
                  ],
                ),
              ),
            );
          } ),
    );
  }
}
