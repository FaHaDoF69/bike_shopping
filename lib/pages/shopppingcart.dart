import 'package:bike_shopping/constant/my_designe_tbn.dart';
import 'package:bike_shopping/pages/check.dart' show Check;
import 'package:bike_shopping/provider/mycard.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:slide_to_act/slide_to_act.dart';

class Shopppingcart extends StatelessWidget {
  Shopppingcart({super.key});
  final textt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF242C3B),
      bottomSheet: Container(
        height: 400,
        decoration: BoxDecoration(
          color: Color.fromARGB(243, 36, 44, 59),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(14),
              child: TextField(
                controller: textt,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.6),
                  hintText: "Pute your Code",
                  hintStyle: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String code = textt.text.trim();
                Provider.of<Cardd>(context, listen: false).applyDiscount(code);
    
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      code == "ABCD"
                          ? "Promo code applied!"
                          : "Invalid promo code",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: code == "ABCD" ? Colors.green : Colors.red,
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.blue),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              child: Text(
                "Apply",
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
            Consumer<Cardd>(
              builder: (context, value, child) {
                return Column(
                  children: [
                    // Subtotal
                    RowText(
                      "Subtotal :",
                      " \$ ${value.subtotal.toStringAsFixed(2)} ",
                    ),
    
                    // Delivery Fee
                    RowText(
                      "Delivery Fee:",
                      "\$  ${value.deliveryFee.toStringAsFixed(2)}",
                    ),
    
                    // Discount
                    RowText(
                      "Discount :",
                      "${(value.discount * 100).toStringAsFixed(0)} %",
                    ),
    
                    SizedBox(height: 0),
    
                    // Total
                    RowText(
                      "Total: ",
                      "\$  ${value.total.toStringAsFixed(2)}",
                      bold: true,
                      color: Color(0xFF0055F4),
                    ),
                  ],
                );
              },
            ),
    
            Padding(
              padding: EdgeInsets.all(25),
              child: SlideAction(
                innerColor: Colors.blue,
                outerColor: Color(0xFF242C3B),
                text: "Checkout",
    
                onSubmit: () async {
                  await Future.delayed(Duration(milliseconds: 500));
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder:
                          (context, animation, secondaryAnimation) => Check(),
                      transitionsBuilder: (
                        context,
                        animation,
                        secondaryAnimation,
                        child,
                      ) {
                        final offsetAnimation = Tween<Offset>(
                          begin: Offset(1.0, 0.0), // From right
                          end: Offset.zero,
                        ).animate(animation);
    
                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
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
          "My Shopping Cart",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Consumer<Cardd>(
        builder: (context, value, child) {
          return SizedBox(
            height: 400,
            child: ListView.builder(
              itemCount: value.selectrdproduct.length,
              itemBuilder: (context, int index) {
                return ListTile(
                  onTap: () {
                    //Navigator.push(context, MaterialPageRoute(builder: Detaille(items, product: items[index])));
                  },
                  minTileHeight: 90,
                  leading: Container(
                    height: 400,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Color(0xFF4C5770),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset(value.selectrdproduct[index].imgpath),
                  ),
                  title: Text(
                    value.selectrdproduct[index].text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
    
                  subtitle: Text(
                    "\$ ${value.selectrdproduct[index].price}",
                    style: TextStyle(color: Color(0xFF3C9EEA)),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

Widget RowText(String label, String value, {bool bold = false, Color? color}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: color ?? Colors.white70,
            fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            fontSize: 18,
          ),
        ),
      ],
    ),
  );
}
