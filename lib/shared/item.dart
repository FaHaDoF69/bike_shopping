

class Item {
  String text;
  double price;
  String imgpath;
  String d;
  Item({required this.text, required this.price, required this.imgpath, required this.d});
}

List<Item> items = [
  Item(text: "PEUGEOT - LR01 ", price:  1.999 , imgpath: "assets/img/bike1.png", d:"assets/3d/Futuristic_Bicycle_De_0421164752_texture.glb"),
  Item(text: "PEUGEOT - LR02 ", price:  2500 , imgpath: "assets/img/bike2.png",d: "assets/3d/Vintage_Racing_Bicycl_0421165033_texture.glb"),
  Item(text: "PILOT - Chromoly ", price:  1433 , imgpath: "assets/img/bike3.png",d:"assets/3d/Black_Stealth_Bicycle_0421165302_texture.glb" ),
  Item(text: "Swift AeroX ", price:  2600 , imgpath: "assets/img/pngwing.png",d: "assets/3d/Green_Mountain_Bike_0421170445_texture.glb"),
  Item(text: "Jetline Speedster ", price: 5999 , imgpath: "assets/img/pngwing2.png",d: "assets/3d/Mountain_Trail_Rider_0421170858_texture.glb"),
  Item(text: "SMITH - Trade", price:  1199 , imgpath: "assets/img/casque.png",d: "assets/3d/Cycling_Helmet_0421165650_texture.glb",),
  Item(text: "	Falcon Racer ", price:  2199 , imgpath: "assets/img/pngwing4.png",d: "assets/3d/Mountain_Bike_Racer_0421170005_texture.glb"),
  
  


];
