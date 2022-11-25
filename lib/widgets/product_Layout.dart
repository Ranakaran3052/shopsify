import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsify/models/CartModel.dart';
import 'package:shopsify/models/ProductModel.dart';
import '../screens/freshScreen.dart';

class ProductItems extends StatelessWidget {
  ProductItems();

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    print("product_Layout");

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
              builder: (ctx, product, Child) => IconButton(
                    onPressed: () {
                      product.toggleFavouriteStatus();
                    },
                    icon: Icon(product.isFavourite!
                        ? Icons.favorite
                        : Icons.favorite_border),
                    color: Theme.of(context).colorScheme.secondary,
                  )),
          title: Center(child: Text(product.title!)),
          trailing: IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("item added to the cart"),
                duration: Duration(seconds: 2),
                action: SnackBarAction(
                  label: "undo ",
                  onPressed: () {
                    // cart.removeSingleitem(product.id);
                  },
                ),
              ));

              cart.addItem(product.id!, product.price!, product.title!);
            },
            icon: Icon(
              Icons.shopping_cart,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
        child: GestureDetector(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => FreshScreen())),
          child: Image.network(
            product.imageUrl!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
