import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:full_stack_ecommerce/constants/global_variables.dart';
import 'package:full_stack_ecommerce/features/account/screens/account_screen.dart';
import 'package:full_stack_ecommerce/features/home/screens/home_screen.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomNavigationBarWidth = 42;
  double bottomBorderWidth = 5;
  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget>  pages = [
    const HomeScreen(),
   const AccountScreen(),
    const Center(
      child: Text("Cart Page"),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          //home bottom bar
          BottomNavigationBarItem(
            
              icon: Container(
                
                width: bottomNavigationBarWidth,
                
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: _page == 0
                          ? GlobalVariables.selectedNavBarColor
                          : GlobalVariables.backgroundColor,
                      width: bottomBorderWidth,
                    ),
                  ),
                ),
                child: const Icon(Icons.home,),
              ),
              label: ""),
          //profile bottom item
          BottomNavigationBarItem(
              icon: Container(
                width: bottomNavigationBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: _page == 1
                          ? GlobalVariables.selectedNavBarColor
                          : GlobalVariables.backgroundColor,
                      width: bottomBorderWidth,
                    ),
                  ),
                ),
                child: const Icon(Icons.person_outline_outlined),
              ),
              label: ""),
          //car bottom bar item
          BottomNavigationBarItem(
              icon: Container(
                  width: bottomNavigationBarWidth,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: _page == 2
                            ? GlobalVariables.selectedNavBarColor
                            : GlobalVariables.backgroundColor,
                        width: bottomBorderWidth,
                      ),
                    ),
                  ),
                  child: Badge(
                    elevation: 0,
                    badgeContent: const Text("2"),
                    badgeColor: Colors.white,
                    child: const Icon(Icons.shopping_cart_outlined),
                  )),
              label: ""),
        ],
      ),
     
    );
  }
}
