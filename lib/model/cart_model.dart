import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = [
    ['Bread', '5.49', 'assets/items/bread.png'],
    ['Milk', '6.25', 'assets/items/milk.png'],
    ['Croissant', '7.89', 'assets/items/croissant.png'],
    ['Frappe', '12.75', 'assets/items/frappe.png'],
    ['Latte', '11.40', 'assets/items/latte.png'],
    ['Cupcake', '8.30', 'assets/items/cupcake.png'],
    ['Donut', '6.95', 'assets/items/donut.png'],
    ['Strawberry Cake', '15.99', 'assets/items/strawberry-cake.png'],
    // ['Chocolate Pastry', '9.80', 'assets/items/chocolate-pastry.png'],
    ['Smoothie', '13.60', 'assets/items/smoothie.png'],
    ['Pancakes', '10.45', 'assets/items/pancakes.png'],
    ['Cookies', '7.15', 'assets/items/cookies.png'],
  ];
  final List _cartItems = [];

  List get shopItems => _shopItems;
  List get cartItems => _cartItems;

  void addItemToCard(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  void removeItemFromCard(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      // تحويل السعر من نص إلى رقم عشري
      totalPrice += double.parse(_cartItems[i][1]);
    }
    //رجع السعر مع رقمين بعد الفاصلة
    return totalPrice.toStringAsFixed(2);
  }
}
