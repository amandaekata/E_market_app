

import 'package:flutter/material.dart';
import 'package:jumia_app/models/products_model.dart';
import 'package:jumia_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key, required this.products});

  final ProductsModel products;
  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    final itemsInCart = Provider.of<CartProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.products.products,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
            ),
            Text(
              widget.products.price.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
            ),
            Row(
              children: [
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(fixedSize: const Size(10, 10)),
                    onPressed: () {
                      widget.products.qty--;
                        itemsInCart.updateQuantities(widget.products);
                    
                  

                      setState(() {});
                    },
                    child: const Text('-')),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  '${widget.products.qty}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 21),
                ),
                const SizedBox(
                  width: 6,
                ),
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(fixedSize: const Size(10, 10)),
                    onPressed: () {
                      widget.products.qty++;
                       
                      
               itemsInCart.updateQuantities(widget.products);
                    
                       
                   
                      setState(() {});
                    },
                    child: const Text('+')),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
