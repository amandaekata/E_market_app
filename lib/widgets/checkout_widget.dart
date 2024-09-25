import 'package:flutter/material.dart';
import 'package:jumia_app/models/products_model.dart';


class CheckoutWidget extends StatefulWidget {
  const CheckoutWidget({super.key, required this.productsModel});
  final ProductsModel productsModel;
  
  @override
  State<CheckoutWidget> createState() => _CheckoutWidgetState();
}

class _CheckoutWidgetState extends State<CheckoutWidget> {

//   void initialize(){
  
//       int quantity = widget.productsModel.qty;
//       int price = int.parse(widget.productsModel.price);
//      int  totalPrice=  quantity* price;
// print('$totalPrice');
//      setState(() {
       
//      });
//   }

//   @override
//   void initState() {
// initialize();
//     super.initState();
//   }

  @override
  Widget build(BuildContext context) {
    int quantity = widget.productsModel.qty;
      int price =widget.productsModel.price;
     int  totalPrice=  quantity* price;
   
    return quantity==0? const  SizedBox(): 
    Padding(
      padding: const EdgeInsets.all(30),
      child: Column( 
        children: [
       Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
       crossAxisAlignment:  CrossAxisAlignment.center,
        children: [ 
      Text(widget.productsModel.products, style:  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
Text('N$totalPrice',style:  const TextStyle(fontSize: 15, fontWeight: FontWeight.bold), )
    

     
      

      
        ],
       ),

        ],
      ),
    );
  }
}