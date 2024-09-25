import 'package:flutter/material.dart';
import 'package:jumia_app/models/products_model.dart';
import 'package:jumia_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';


class GroceryWidget extends StatefulWidget {
  final ProductsModel products;
  GroceryWidget({super.key, required this.products});

  @override
  State<GroceryWidget> createState() => _GrocerylistWidgetState();
}

class _GrocerylistWidgetState extends State<GroceryWidget> {



 final  TextEditingController _qtyController = TextEditingController();

  @override
  void initState() {
    _qtyController.addListener(onTextChange);

    super.initState();
  }

  void onTextChange() {
    if (_qtyController.text == "") {
      show = false;
    } else {
      show = true;
    }
    setState(() {});
  }

  bool show = false;

  @override
  Widget build(BuildContext context) {
    final cartt = Provider.of<CartProvider>(context);
    return Column(
      children: [
        Row(
          children: [
            const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.orange,
              size: 40,
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.products.products,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  widget.products.price.toString(),
                  style: const TextStyle(fontSize: 11),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: 50,
              height: 50,
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: 'QTY.',
                    hintStyle: TextStyle(fontSize: 10, color: Colors.black),
                    border: OutlineInputBorder()),
                controller: _qtyController,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        show
            ? Center(
                child: TextButton(
                    onPressed: () {
                       if (_qtyController.text.isNotEmpty) {
                int quantity = int.tryParse(_qtyController.text) ?? 1;
                widget.products.qty = quantity;
              }
                      _qtyController.text = "";
                      cartt.addItem = widget.products;
                    },
                    child: const Text(
                      "Add to cart",
                      textAlign: TextAlign.end,
                    )),
              )
            : const SizedBox()
      ],
    );
  }
}
