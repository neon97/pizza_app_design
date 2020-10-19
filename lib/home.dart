import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pizza_shop/detailpage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: ListView(
          children: [
            SizedBox(
              height: 10.0,
            ),
//making the location and the cart
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(
                        width: 3.0,
                      ),
                      Text(
                        "Los Angeles, California",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ],
                  ),
                  Container(
                    height: 55.0,
                    width: 55.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border:
                            Border.all(color: Colors.grey[300], width: 2.0)),
                    child: Icon(Icons.shopping_basket),
                  )
                ],
              ),
            ),

            SizedBox(
              height: 30.0,
            ),
//
// Container for the info for 10 min delivery
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Container(
                height: 160.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color.fromRGBO(255, 248, 230, 1),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: width / 20),
                      height: 150.0,
                      width: width / 2.2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "10-minute\ndelivery",
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(215, 153, 79, 1)),
                          ),
                          SizedBox(
                            height: width / 30,
                          ),
                          Text(
                            "Enjoy your food in just 10\nminutes. Free Forever",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),

                    //here comes the image
                    Container(
                      height: 150.0,
                      width: width / 2.5,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/images/pizzagirl.png"))),
                    )
                  ],
                ),
              ),
            ),
            //container ends here
            SizedBox(
              height: 10.0,
            ),

            Padding(
              padding: EdgeInsets.all(
                20.0,
              ),
              child: Text("Explore cuisines",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
            ),
            //we need the widget here now that is in listview
            Container(
              height: 180.0,
              width: width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child:
                        pizzaTabs("Italian", "34", "assets/images/pizza.png"),
                  ),
                  pizzaTabs("Mexican", "24", "assets/images/mexican.png"),
                  pizzaTabs("American", "21", "assets/images/burger.png")
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),

            //new tab for the reataurant in cities....
            Padding(
              padding: EdgeInsets.all(
                20.0,
              ),
              child: Row(
                children: [
                  Text("Restaurants in ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  Text("Los Angeles ,California",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(215, 153, 79, 1)))
                ],
              ),
            ),
            //its container
            Container(
              // color: Colors.red,
              height: 200.0,
              width: width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: restaurantsTabs("https://rb.gy/wqz3ug",
                          "Pizzeria Mazza", "Italian", "4.9km")),
                  restaurantsTabs(
                      "https://rb.gy/two7g2", "Taco Land", "Mexican", "3.2km"),
                  restaurantsTabs("https://rb.gy/zt8plw", "Continental Cui",
                      "Cuisine", "4.9km")
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.green,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.circle,
                color: Colors.grey[400],
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.grey[400],
              ),
              label: ""),
        ],
      ),
    );
  }

  Widget restaurantsTabs(
      String address, String name, String dish, String diatance) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
        padding: EdgeInsets.only(right: 20.0),
        child: GestureDetector(
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => DetailPage())),
          child: Container(
            width: width / 2.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 120.0,
                  width: width / 2.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                          image: NetworkImage(address), fit: BoxFit.cover)),
                ),
                //name of the dish
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  name,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "$dish - $diatance - \$-10",
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget pizzaTabs(String title, String no, String assetimage) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(right: 20.0),
      child: Container(
        height: 170.0,
        width: width / 3.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Color.fromRGBO(255, 248, 230, 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text("$no restaurants", style: TextStyle(color: Colors.grey)),
            SizedBox(
              height: 10.0,
            ),
            Image(
              image: AssetImage(assetimage),
              height: 80.0,
              width: 80.0,
            )
          ],
        ),
      ),
    );
  }
}
