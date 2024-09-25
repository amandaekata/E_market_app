import 'package:flutter/material.dart';
import 'package:jumia_app/models/products_model.dart';
import 'package:jumia_app/providers/cart_provider.dart';
import 'package:jumia_app/screens/cart_screen.dart';

import 'package:jumia_app/widgets/grocerylist_widget.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<ProductsModel> groceryList = [
    ProductsModel(price: 100, products: 'Banana', id: 1),
    ProductsModel(price: 250, products: 'Apple', id: 2),
    ProductsModel(price: 800, products: 'Carrots', id: 3),
    ProductsModel(price: 100, products: 'Yam', id: 4),
    ProductsModel(price: 290, products: 'Egg', id: 5),
    ProductsModel(price: 500, products: 'Maggi', id: 6),
    ProductsModel(price: 150, products: 'Onions', id: 7),
    ProductsModel(price: 400, products: 'Peppers', id: 8),
    ProductsModel(price: 900, products: 'Cucumber', id: 9),
    ProductsModel(price: 100, products: 'Watermelon', id: 10),
    ProductsModel(price: 100, products: 'Palm oil', id: 11),
    ProductsModel(price: 230, products: 'Groundnut oil', id: 12),
    ProductsModel(price: 250, products: 'Potatoes', id: 13),
    ProductsModel(price: 430, products: 'Cassava', id: 14),
    ProductsModel(price: 600, products: 'Corn', id: 15),
    ProductsModel(price: 120, products: 'Salt', id: 16),
    ProductsModel(price: 450, products: 'Pinneaple', id: 17),
    ProductsModel(price: 100, products: 'Orange', id: 18),
    ProductsModel(price: 100, products: 'Beans', id: 19),
  ];
  List<ProductsModel> filteredGroceryList = [];
  TextEditingController Controllerr = TextEditingController();

  @override
  void initState() {
    filteredGroceryList = groceryList;
    super.initState();
  }

  void searching(String query) {
    final suggestions = groceryList.where((ProductsModel) {
      final items = ProductsModel.products.toLowerCase();
      final input = query.toLowerCase();
      return items.contains(input);
    }).toList();
    setState(() {
      filteredGroceryList = suggestions;
    });
  }

  @override
  Widget build(BuildContext context) {
    final items = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          'E-MARKET',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartScreen()));
            },
            icon: Stack(
              children: [
                const Icon(
                  Icons.shopping_cart,
                  size: 35,
                  color: Colors.black,
                ),
                items.cartItems.isEmpty
                    ? const SizedBox()
                    : Positioned(
                        bottom: 0,
                        child: Container(
                            height: 20,
                            width: 20,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(70)),
                            ),
                            child: Text(
                              '${items.cartItems.length}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.white),
                            )),
                      )
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            SearchBar(
              controller: Controllerr,
              hintText: 'Search for products',
              onChanged: searching,
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: filteredGroceryList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GroceryWidget(products: filteredGroceryList[index]);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
