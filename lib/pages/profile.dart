import 'package:bike_shopping/constant/my_designe_tbn.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF353F54),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.all(5),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: MyDesigneTbn(
              icons: Icon(IconlyLight.arrow_left_2, color: Colors.white),
            ),
          ),
        ),
        title: Text(
          "Info",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile picture (optional)
            Center(
              child: CircleAvatar(
                radius: 50,
                //backgroundImage: AssetImage('assets/img/profile.png'),
                child: Text("LOGO"), // add your own image
              ),
            ),
            SizedBox(height: 20),
            
            // User name
            Text(
              "Name: Your name",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 10),
            
            // Email or username
            Text(
              "Email: Your adress",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 10),
            
            // Phone or other info
            Text(
              "Phone: Your phone",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 10),

            // Membership / Orders / Anything you want
            Text(
              "Membership: Premium",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),

            Spacer(),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                child: Text("Back", style: TextStyle(color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}