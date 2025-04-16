import 'package:eventra/rive/menu.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu(
      {super.key,
      required this.menu,
      required this.press,
      required this.icon,
      this.isActive = false});

  final Menu menu;
  final bool isActive;
  final IconData icon;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Divider(color: Colors.white24, height: 1),
        ),
        Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn,
              width: isActive ? 288 : 0,
              height: 56,
              left: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF6792FF),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            ListTile(
              onTap: press,
              leading: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.transparent,
                child: Icon(icon, color: Colors.white),
              ),
              title: Text(
                menu.title,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
