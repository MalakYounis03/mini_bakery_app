import 'package:flutter/material.dart';

class GroceryItemTitle extends StatelessWidget {
  const GroceryItemTitle({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.imgPath,
    required this.onPressed,
  });

  final String itemName;
  final String itemPrice;
  final String imgPath;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.brown[100],
          borderRadius: BorderRadius.circular(8),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(imgPath, height: 70),
            Text(itemName),
            MaterialButton(
              onPressed: onPressed,
              color: Colors.brown[800],
              child: Text(
                "\$$itemPrice",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
