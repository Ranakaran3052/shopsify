import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsify/models/CartModel.dart' show Cart;
import 'package:shopsify/screens/SignInPage.dart';

import '../widgets/CartItem.dart';

class CartScreen extends StatelessWidget {
  static var routeName = "/-CartScreen";

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    print("Cart");
    return Scaffold(
      appBar: AppBar(
          title: const Center(
        child: Text(
          "Cart",
          style: TextStyle(color: Colors.white),
        ),
      )),
      body: Column(
        children: [
          Card(
              margin: const EdgeInsets.all(15),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Total"),
                    Chip(
                      label: Text(
                        '\$${cart.totalAmount.toStringAsFixed(2)}',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "ORDER ",
                        selectionColor: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              )),
          Expanded(
              child: ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (ctx, i) => CartItem(
                        cart.items.values.toList()[i].id,
                        cart.items.keys.toList()[i],
                        cart.items.values.toList()[i].quantity,
                        cart.items.values.toList()[i].price,
                        cart.items.values.toList()[i].title,
                      )))
        ],
      ),
    );
  }
}
