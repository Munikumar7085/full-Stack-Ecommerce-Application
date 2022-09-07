import 'package:flutter/material.dart';

class DealOfTheDay extends StatelessWidget {
  const DealOfTheDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15, top: 10),
          child: const Text(
            "Deal of the day",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        Image.network(
          "https://m.media-amazon.com/images/W/WEBP_402378-T2/images/I/71p9wKfpPJL._AC_UL480_FMwebp_QL65_.jpg",
          fit: BoxFit.fitHeight,
          height: 235,
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15),
          child: const Text(
            "\$1000",
            style: TextStyle(fontSize: 18),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            left: 15,
            top: 5,
            right: 40,
          ),
          child: const Text(
            "HP Windows 11 AMD All-in-One Ryzen 5-5625U 23.8 inches(60.5 cm) 8GB RAM/512GB SSD/FHD, Micro-Edge, Anti-Glare Display/Wireless Keyboard & Mouse/Radeon Graphics/Win 11/MSO 2021, 24-ck0678in",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Image.network(
                "https://m.media-amazon.com/images/W/WEBP_402378-T2/images/I/81tVNSIo7nL._SX679_.jpg",
                fit: BoxFit.fitWidth,
                height: 100,
                width: 100,
              ),
              Image.network(
                "https://m.media-amazon.com/images/W/WEBP_402378-T2/images/I/81tVNSIo7nL._SX679_.jpg",
                fit: BoxFit.fitWidth,
                height: 100,
                width: 100,
              ),
              Image.network(
                "https://m.media-amazon.com/images/W/WEBP_402378-T2/images/I/81tVNSIo7nL._SX679_.jpg",
                fit: BoxFit.fitWidth,
                height: 100,
                width: 100,
              ),
              Image.network(
                "https://m.media-amazon.com/images/W/WEBP_402378-T2/images/I/81tVNSIo7nL._SX679_.jpg",
                fit: BoxFit.fitWidth,
                height: 100,
                width: 100,
              ),
              Image.network(
                "https://m.media-amazon.com/images/W/WEBP_402378-T2/images/I/81tVNSIo7nL._SX679_.jpg",
                fit: BoxFit.fitWidth,
                height: 100,
                width: 100,
              ),
              
            ],
          ),
        ),
        Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                alignment: Alignment.topLeft,
                child: Text(
                  "See all deals",
                  style: TextStyle(
                    color: Colors.cyan[800],
                  ),
                ),
              ),
      ],
    );
  }
}
