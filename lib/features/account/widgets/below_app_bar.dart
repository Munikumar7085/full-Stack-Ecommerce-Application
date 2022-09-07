import 'package:flutter/material.dart';
import 'package:full_stack_ecommerce/constants/global_variables.dart';
import 'package:full_stack_ecommerce/provider/user_provider.dart';
import 'package:provider/provider.dart';

class BelowAppBar extends StatelessWidget {
  const BelowAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      decoration: const BoxDecoration(gradient: GlobalVariables.appBarGradient),
      child: Row(children: [
        Container(
          padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
          child: RichText(
            text: TextSpan(
                text: "Hello, ",
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: user.name,
                    style: const TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )
                ]),
          ),
        ),
      ]),
    );
  }
}
