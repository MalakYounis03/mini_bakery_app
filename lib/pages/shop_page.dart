import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_bakery_app/components/grocery_item_title.dart';
import 'package:mini_bakery_app/model/cart_model.dart';
import 'package:mini_bakery_app/pages/cart_page.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 20),
          child: Text("Shope", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0, top: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartPage()),
                );
              },
              child: Image.asset("assets/shopping-cart.png"),
            ),
          ),
        ],
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Craving something Sweet?",
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Pick Your Treats",
              style: GoogleFonts.notoSerif(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 22),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(),
          ),
          SizedBox(height: 22),
          Expanded(
            child: Consumer<CartModel>(
              builder: (context, value, child) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.2,
                  ),
                  itemBuilder: (context, index) => GroceryItemTitle(
                    itemName: value.shopItems[index][1],
                    itemPrice: value.shopItems[index][2],
                    imgPath: value.shopItems[index][3],
                    onPressed: () {
                      Provider.of<CartModel>(
                        context,
                        listen: false,
                      ).addItemToCard(index);
                    },
                  ),
                  padding: EdgeInsets.all(12),
                  itemCount: value.shopItems.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
