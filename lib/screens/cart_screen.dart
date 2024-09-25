import 'package:flutter/material.dart';


import 'package:jumia_app/providers/cart_provider.dart';
import 'package:jumia_app/screens/checkout_screen.dart';

import 'package:jumia_app/widgets/cart_widget.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
 const  CartScreen({
    super.key, 
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartt = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Cart',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
      
        child: cartt.cartItems.isEmpty? 
          const   Center(child: Text('No Items In Cart', style:  TextStyle(fontSize: 21),),):
        Column(
          children: [
           
            Expanded( 
              child: ListView.builder(
                  itemCount: cartt.cartItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CartWidget(
                      products: cartt.cartItems[index],
                    );
                  }),
            ),
         
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    fixedSize: const Size(250, 30)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CheckoutScreen()));
                         
                },
                child: const Text('Proceed to Checkout '))
          ],
        ),
      ),
    );
  }
}
