import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartcanteen/widgets/categorieswidget.dart';
import 'package:smartcanteen/widgets/popular_widget.dart';
import 'package:smartcanteen/widgets/shop_widget.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 300,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "What would you like to have",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Icon(Icons.search),
                  ],
                ),
              ),
            ),
          ),

          // Category
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 20,
            ),
            child: Text(
              "Categories",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          // categories widget
          CategoriesWidget(),

          // popular menu
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 20,
            ),
            child: Text(
              "Popular",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          // popular widget
          PopularWidget(),

          // shop
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 20,
            ),
            child: Text(
              "Shop",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),

          // shop widget
          ShopWidget(),
        ],
      ),
    );
  }
}
