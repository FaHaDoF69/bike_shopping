import 'package:bike_shopping/shared/item.dart';
import 'package:flutter/material.dart';

class Cardd with ChangeNotifier {
  List selectrdproduct = [];
 int sum = 0;
  
  double _discount = 0.0;

  void applyDiscount(String code) {
    if (code == "ABCD") {
      _discount = 0.2; // 20% discount
    } else {
      _discount = 0.0;
    }
    notifyListeners();
  }

  double get discount => _discount;

  double get subtotal {
    return selectrdproduct.fold(0, (sum, item) => sum + item.price);
  }

  double get deliveryFee => 200;

  double get total {
    double discountAmount = subtotal * _discount;
    return subtotal + deliveryFee - discountAmount;
  }

    
  void addproduct(Item product) {
    selectrdproduct.add(product);
    notifyListeners();

    
  
  }

  void remove(Item product) {
    selectrdproduct.remove(product);
    notifyListeners();
  }
}

