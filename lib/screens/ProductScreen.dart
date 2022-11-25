import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsify/models/CartModel.dart';
import 'package:shopsify/screens/CartScreen.dart';
import 'package:shopsify/widgets/Drawer/Drawer.dart';
import 'package:shopsify/widgets/ProductrGrid.dart';
import '../widgets/Badge.dart';

enum FilterOption {
  Favorite,
  All,
}

class ProductScreen extends StatefulWidget {
  static var routeName = "/-ProductDetails";
  ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    print("product_screen");
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Shopsify",
          textAlign: TextAlign.center,
        ),
        actions: [
          PopupMenuButton(
              onSelected: (FilterOption SelectedValue) {
                setState(() {
                  if (SelectedValue == FilterOption.Favorite) {
                    _showOnlyFavorites = true;
                  } else {
                    _showOnlyFavorites = false;
                  }
                });
              },
              itemBuilder: (_) => [
                    const PopupMenuItem(
                      value: FilterOption.Favorite,
                      child: Text(
                        "Favourite",
                      ),
                    ),
                    const PopupMenuItem(
                      value: FilterOption.All,
                      child: Text("Show all"),
                    ),
                  ]),
          Consumer<Cart>(
              builder: (_, cart, ch) => Badge(
                    value: cart.items.toString(),
                    child: ch,
                  ),
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => CartScreen()));
                },
              ))
        ],
      ),
      drawer: Drawer(
        child: DrawerScreen(),
      ),
      body: ProductGrid(_showOnlyFavorites),
    );
  }
}
