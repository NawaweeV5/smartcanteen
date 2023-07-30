import 'package:flutter/material.dart';

class PopularWidget extends StatelessWidget {
  const PopularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        child: Row(
          children: [
            // single items
            for (int i = 0; i < 10; i++)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7),
              child: Container(
                width: 170,
                height: 225,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.black,
                  //     spreadRadius: 1,
                  //     blurRadius: 3,
                  //     offset: Offset(0, 3),
                  //   ),
                  // ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "images/slideimage2.png",
                          height: 130,
                        ),
                      ),
                      Text(
                        "Ameen & V5",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "2 lnwza ICT",
                        style: TextStyle(
                          fontSize: 14,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "999 Baht",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                            ),
                          ),
                          Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                            size: 26,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
