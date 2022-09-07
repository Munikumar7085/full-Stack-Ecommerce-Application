
import 'package:flutter/material.dart';
import 'package:full_stack_ecommerce/constants/global_variables.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List images = [
    "https://images-eu.ssl-images-amazon.com/images/W/WEBP_402378-T2/images/I/41iEZV6nKbL._SX300_SY300_QL70_FMwebp_.jpg",
    "https://images-eu.ssl-images-amazon.com/images/W/WEBP_402378-T2/images/I/41iEZV6nKbL._SX300_SY300_QL70_FMwebp_.jpg",
    "https://images-eu.ssl-images-amazon.com/images/W/WEBP_402378-T2/images/I/41iEZV6nKbL._SX300_SY300_QL70_FMwebp_.jpg",
    "https://images-eu.ssl-images-amazon.com/images/W/WEBP_402378-T2/images/I/41iEZV6nKbL._SX300_SY300_QL70_FMwebp_.jpg",
    "https://images-eu.ssl-images-amazon.com/images/W/WEBP_402378-T2/images/I/41iEZV6nKbL._SX300_SY300_QL70_FMwebp_.jpg",
    
    ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15),
              child: const Text(
                "Your orders",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 15),
              child: Text(
                "See all",
                style: TextStyle(color: GlobalVariables.selectedNavBarColor),
              ),
            )
          ],
        ),
        Container(
          height: 170,
          padding: const EdgeInsets.only(
            left: 10,
            top: 20,
            right: 0,
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: images.length,
            itemBuilder: ((context, index) => SizedBox(
                  height: 100,
                  child: Image.network(
                    images[index],
                    height: 100,
                  ),
                )),
          ),
          //
        ),
      ],
    );
  }
}
