import 'package:edge_alert/edge_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/screens/details/details_screen.dart';
//import 'package:shop_app/screens/home/details_screen.dart';

import '../../../loginpage.dart';
import 'categories.dart';
import 'item_card.dart';

const kMainColor = Color(0xFF573851);

class Body1 extends StatefulWidget {
  @override
  _Body1State createState() => _Body1State();
}

class _Body1State extends State<Body1> {
  List<String> categories = ["Hand bag", "Jewellery", "Footwear", "Dresses"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Women's Fashion ",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            highlightColor: Colors.red,
            onPressed: () => Navigator.pop(context),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.black,
              ),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                FirebaseAuth.instance.authStateChanges().listen((User user) {
                  if (user == null) {
                    EdgeAlert.show(context,
                        title: "Success",
                        description: 'You have Logged out Successfully!',
                        gravity: EdgeAlert.BOTTOM,
                        backgroundColor: Colors.green,
                        icon: Icons.check_circle);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => LoginPage()),
                        (Route<dynamic> route) => false);
                  }
                });
              },
            ),
          ],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                child: Text('Hand bag', style: TextStyle(color: kMainColor)),
              ),
              Tab(
                child: Text('Jewellery', style: TextStyle(color: kMainColor)),
              ),
              Tab(
                child: Text('Footwear', style: TextStyle(color: kMainColor)),
              ),
              Tab(
                child: Text('Dresses', style: TextStyle(color: kMainColor)),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: GridView.builder(
                    itemCount: bags.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return ItemCard(
                        product: bags[index],
                        press: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                      product: bags[index],
                                    ))),
                      );
                    }),
              ),
            ),
Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: GridView.builder(
                    itemCount: jewels.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return ItemCard(
                        product: jewels[index],
                        press: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                      product: jewels[index],
                                    ))),
                      );
                    }),
              ),
            ),            Center(child: Text('Tab 3')),
            Center(child: Text('Tab 4')),
          ],
        ),
      ),
    );
  }
}
