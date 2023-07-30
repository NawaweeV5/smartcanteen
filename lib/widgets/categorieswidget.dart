import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        child: Row(
          children: [
            // single item
            // for (int i = 0; i < 10; i++)


              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(),
                    ],
                  ),
                  child: Image.asset(
                    "images/slideimage4.png",
                    width: 70,
                    height: 70,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(),
                    ],
                  ),
                  child: Image.asset(
                    "images/slideimage3.png",
                    width: 70,
                    height: 70,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(),
                    ],
                  ),
                  child: Image.asset(
                    "images/slideimage2.png",
                    width: 70,
                    height: 70,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(),
                    ],
                  ),
                  child: Image.asset(
                    "images/slideimage1.png",
                    width: 70,
                    height: 70,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(),
                    ],
                  ),
                  child: Image.asset(
                    "images/slideimage2.png",
                    width: 70,
                    height: 70,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(),
                    ],
                  ),
                  child: Image.asset(
                    "images/slideimage3.png",
                    width: 70,
                    height: 70,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
