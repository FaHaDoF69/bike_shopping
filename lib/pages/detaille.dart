import 'package:bike_shopping/constant/my_designe_tbn.dart';
import 'package:bike_shopping/provider/mycard.dart';
import 'package:bike_shopping/shared/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class Detaille extends StatelessWidget {
  Item product;
  Detaille(item, {super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF353F54),
      bottomSheet: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Color(0xFF353F54),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 2,
              blurRadius: 9,
              offset: Offset(1, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "\$ ${product.price}",
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.blue),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              child: Consumer<Cardd>(
                builder: (context, value, child) {
                  return GestureDetector(
                    onTap: () {
                      value.addproduct(product);
                    },
                    child: Text(
                      "Add to Card",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    
      body: Stack(
        children: [
          Positioned(
            left: 30,
            top: -100,
    
            child: Image.asset('assets/img/backroung1.png', width: 400),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  children: [
                    SizedBox(height: 60),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: MyDesigneTbn(
                            icons: Icon(IconlyLight.arrow_left_2, color: Colors.white),
                          ),
                        ),
                        Text(
                          product.text,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    SizedBox(
                      height: 280,
                      child: Flutter3DViewer(src: product.d))
                    
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(0, 3),
                        spreadRadius: 2,
                        blurRadius: 9,
                      ),
                    ],
                    color: Color.fromARGB(255, 43, 50, 67),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(23),
                      topRight: Radius.circular(23),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Center(
                              child: Container(
                                height: 40,
                                width: 140,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 41, 50, 65),
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    const BoxShadow(
                                      color: Color(0xFF3A3F4B),
                                      offset: Offset(2, 2),
                                      blurRadius: 6,
                                    ),
                                    const BoxShadow(
                                      color: Color(0xFF1C1F26),
                                      offset: Offset(-2, -2),
                                      blurRadius: 6,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Consumer <Cardd>(
                                    builder: (context, value, child) {
                                      return Text(
                                        "Description ",
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      );
                                    },
                                  
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                height: 40,
                                width: 140,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 61, 72, 89),
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    const BoxShadow(
                                      color: Color(0xFF3A3F4B),
                                      offset: Offset(2, 2),
                                      blurRadius: 6,
                                    ),
                                    const BoxShadow(
                                      color: Color(0xFF1C1F26),
                                      offset: Offset(-2, -2),
                                      blurRadius: 6,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    "Specification ",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Text(
                          product.text,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 8),
    
                        Text(
                          "The LR01 uses the same design as the most iconic bikes from PEUGEOT Cycles' 130-year history and combines it with agile, dynamic performance that's perfectly suited to navigating today's cities. As well as a lugged steel frame and iconic PEUGEOT black-and-white chequer design, this city bike also features a 16-speed Shimano Claris drivetrain.",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
