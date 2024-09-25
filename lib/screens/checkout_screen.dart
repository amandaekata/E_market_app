import 'package:flutter/material.dart';
import 'package:jumia_app/providers/cart_provider.dart';
import 'package:jumia_app/widgets/checkout_widget.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreen();
}

class _CheckoutScreen extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    final itemsInCart = Provider.of<CartProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Checkout',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.orange,
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: itemsInCart.cartItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CheckoutWidget(
                          productsModel: itemsInCart.cartItems[index]);
                    })),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Total Price:  ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Container(
                    height: 40, width: 80,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.orange,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(3))),
               child:  Center(child: Text('${ itemsInCart.totalPrice()}', textAlign: TextAlign.center,))
               
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        fixedSize: const Size(250, 30)),
                    onPressed: () {},
                    child: const Text(
                      'Pay Now',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )),
              ),
            )
          ],
        ));
  }
}
