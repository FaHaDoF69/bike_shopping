import 'dart:ui';

import 'package:bike_shopping/constant/my_designe_tbn.dart';
import 'package:bike_shopping/pages/check.dart';
import 'package:bike_shopping/pages/detaille.dart';
import 'package:bike_shopping/pages/profile.dart';
import 'package:bike_shopping/pages/shopppingcart.dart';
import 'package:bike_shopping/provider/mycard.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:standard_searchbar/old/standard_searchbar.dart';

import '../shared/item.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _showSearchBar = false;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Scaffold(
        // a bottom navigation bar
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Color(0xFF353F54),
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 3),
                spreadRadius: 4,
                blurRadius: 9,
                color: Colors.white,
              ),
            ],
          ),
          child: GNav(
            //backgroundColor: Colors.blue.shade800,
            haptic: true, // haptic feedback
            // tabShadow: [
            //   BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 2),
            // ], // tab button shadow
            tabBorderRadius: 20,
            curve: Curves.ease, // tab animation curves
            duration: Duration(milliseconds: 10), // tab animation duration
            gap: 12, // the tab button gap between icon and text
            color: Colors.white,
            rippleColor: Colors.grey,
            hoverColor: const Color.fromARGB(83, 255, 255, 255),
            activeColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 17),
            tabs: [
              GButton(
                // onPressed: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => Home()),
                //   );
                // },
                icon: Icons.pedal_bike,
                text: "Bikes",
              ),
              GButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Shopppingcart()),
                  );
                },
                icon: IconlyLight.buy,
                text: "Store",
              ),
              
              GButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Check()),
                  );
                },
                icon: IconlyLight.paper,
                text: "Setting",
              ),
              GButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                },
                icon: IconlyLight.profile,
                text: "Profile",
              ),
            ],
          ),
        ),
    
        // a bachground color
        backgroundColor: Color(0xFF353F54),
        body: Stack(
          children: [
            // a background image
            Positioned(
              left: 40,
              top: 180,
    
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 120),
                child: Image.asset(
                  'assets/img/backroung1.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            // custom scrol view for scrol
            CustomScrollView(
              slivers: [
                // app bar with a search btn
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  stretch: true,
                  pinned: true,
                  expandedHeight: 360,
                  backgroundColor: Colors.transparent,
    
                  actionsPadding: EdgeInsets.all(8),
                  centerTitle: false,
    
                  title: Text(
                    "Choose Your Bike",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  actions: [
                    if (_showSearchBar)
                      Positioned(
                        left: 10,
                        right: 200,
                        child: StandardSearchBar(
                          width: 330,
                          // suggestions: [
                          //   'apple',
                          //   'banana',
                          //   'melon',
                          //   'orange',
                          //   'pineapple',
                          //   'strawberry',
                          //   'watermelon',
                          // ],
                        ),
                      ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _showSearchBar = !_showSearchBar;
                        });
                      },
                      child: MyDesigneTbn(
                        icons: Icon(Icons.search, color: Colors.white),
                      ),
                    ),
                  ],
                  // designe for image
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      children: [
                        SizedBox(height: 120),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: SizedBox(
                            height: 270,
                            width: double.infinity,
                            child: Stack(
                              children: [
                                Image.asset(
                                  "assets/img/back3.png",
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  top: 40,
                                  right: 40,
                                  child: Image.asset("assets/img/bike1.png"),
                                ),
                                Positioned(
                                  top: 200,
                                  left: 40,
                                  child: Text(
                                    "30% Off",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white30,
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
    
                // a grid view for all item with a good decoration
                SliverGrid.builder(
                  itemCount: items.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    Detaille(items, product: items[index]),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          Center(
                            child: Image.asset(
                              "assets/img/grid2.png",
                              width: 180,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned(
                            left: 150,
                            top: 12,
                            child: Consumer<Cardd>(
                              builder: (context, value, child) {
                                return IconButton(
                                  onPressed: () {
                                    value.addproduct(items[index]);
                                  },
                                  icon: Icon(Icons.add),
                                  color: Colors.white,
                                );
                              },
                            ),
                          ),
                          Positioned(
                            top: 10,
                            left: 20,
                            child: Image.asset(
                              items[index].imgpath,
                              width: 150,
                            ),
                          ),
                          Positioned(
                            top: 120,
                            left: 30,
                            child: Column(
                              children: [
                                Text(
                                  "Road bike",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  items[index].text,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "\$ ${items[index].price}",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
