import 'package:flutter/material.dart';
import 'package:full_stack_ecommerce/features/account/widgets/account_button.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({Key? key}) : super(key: key);

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
              text: "your orders",
              onTap: () {},
            ),
            AccountButton(
               text: "turn seller",
              onTap: () {},
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            AccountButton(
              text: "Logout",
              onTap: () {},
            ),
            AccountButton(
              text: "Your wish list",
              onTap: () {},
            )
          ],
        )
      ],
    );
  }
}
