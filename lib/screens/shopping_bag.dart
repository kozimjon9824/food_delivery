import 'package:flutter/material.dart';

class MyShoppingBag extends StatefulWidget {
  @override
  _MyShoppingBagState createState() => _MyShoppingBagState();
}

class _MyShoppingBagState extends State<MyShoppingBag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Item Carts',style: TextStyle(color:Colors.black,fontSize: 18.0,fontWeight: FontWeight.w600),),
        actions: [
          Icon(Icons.shopping_bag_outlined,size: 30.0,color: Colors.black)
        ],
      ),

      body: ListView(
        children: [
          Container(
            height: 120,
            margin: EdgeInsets.all(4.0),
            child: Card(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Image.asset('assets/pic3.jpg',height: 110.0,width: 110.0),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 6.0),
                            child: RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(text: 'Cereal\n',style: TextStyle(color: Colors.black,fontSize: 18.0,fontWeight: FontWeight.w500)),
                                    TextSpan(text: '\$100',style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.w400)),
                                  ]
                              ),
                            ),
                          ),
                          IconButton(icon: Icon(Icons.delete_outlined,color: Colors.black,size: 24.0), onPressed: (){})
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(icon: Icon(Icons.remove,size: 20.0,), onPressed: (){}),
                          GestureDetector(
                            onTap: (){},
                            child: Container(
                              color: Colors.red,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 14.0),
                                child: Text('Add To 2',style: TextStyle(color: Colors.white,fontSize: 14.0)),
                              ),
                            ),
                          ),
                          IconButton(icon: Icon(Icons.add,color: Colors.red,size: 20.0,), onPressed: (){}),

                        ],)

                    ],),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
