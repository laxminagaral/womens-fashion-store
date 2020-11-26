

import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      
    ); 
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor:Colors.white,
      elevation: 1,
      leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
      highlightColor: Colors.grey[300],
       onPressed: ()=> Navigator.pop(context),
       ),
       actions: <Widget>[
         IconButton(icon: Icon(Icons.search,color: Colors.black,),
          onPressed: (){},
          ),
          IconButton(icon: Icon(Icons.shopping_cart,color: Colors.black,),
          onPressed: (){},
          ),
          SizedBox(width:10),
      
       ],
      
    );
  }
}
