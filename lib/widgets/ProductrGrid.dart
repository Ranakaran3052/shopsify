import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsify/models/ProductsDetails.dart';
import 'product_Layout.dart';

class ProductGrid extends StatelessWidget {
  final bool showFav;

  ProductGrid(this.showFav);

  @override
  Widget build(BuildContext context) {
    final productsdata = Provider.of<Products>(context);
    final products = showFav ? productsdata.favouriteItems : productsdata.item;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: products[i], child: ProductItems()),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          mainAxisSpacing: 10),
    );
  }
}
