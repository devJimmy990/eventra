import 'package:eventra/rive/menu.dart';
import 'package:flutter/material.dart';

import 'animated_bar.dart';

class BtmNavItem extends StatelessWidget {
  const BtmNavItem(
      {super.key,
      required this.navBar,
      required this.press,
      required this.selectedNav});

  final Menu navBar;
  final VoidCallback press;
  final Menu selectedNav;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedBar(isActive: selectedNav == navBar),
          SizedBox(
            height: 36,
            width: 36,
            child: Opacity(
              opacity: selectedNav == navBar ? 1 : 0.5,
              child: Icon(Icons.add)
            ),
          ),
        ],
      ),
    );
  }
}
