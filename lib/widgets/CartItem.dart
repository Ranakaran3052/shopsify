import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  const CartItem(
    this.id,
    this.title,
    this.quantity,
    this.price,
    this.productId,
  );
  final String? id;
  final String? title;
  final int? quantity;
  final double? price;
  final String? productId;

  @override
  Widget build(BuildContext context) {
    //print(title);
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: ((ctx) => AlertDialog(
                  title: const Text('are you sure '),
                  content:
                      const Text('do you want to remove the item from cart?'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop(false);
                        },
                        child: const Text("no")),
                    TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop(true);
                        },
                        child: const Text("yes"))
                  ],
                )));
      },
      onDismissed: (direction) {
        Provider.of(context, listen: false).removeItem(productId);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Padding(
                padding: EdgeInsets.all(5),
                child: FittedBox(child: Text('\$$price')),
              ),
            ),
            title: Text(title!),
            subtitle: Text("total :\$${(price! * quantity!)} "),
            trailing: Text("$quantity"),
          ),
        ),
      ),
    );
  }
}
