import 'dart:math';
import 'package:eventra/core/constants/color_manager.dart';
import 'package:eventra/features/user/home/presentation/view/explore_view.dart';
import 'package:eventra/rive/menu.dart';
import 'package:eventra/rive/side_bar.dart';
import 'package:eventra/rive/side_bar/menu_btn.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen>
    with SingleTickerProviderStateMixin {
  bool isSideBarOpen = false;
  int selectedIndex = 0;
  late PageController _pageController;
  late AnimationController _animationController;
  late Animation<double> scaleAnimation;
  late Animation<double> animation;

  Menu selectedButtonNav = bottomNavItems.first;
  Menu selectedSideMenu = sidebarMenus.first;

  late SMIBool isMenuOpenInput;

  @override
  void initState() {
    _pageController = PageController();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 30))
      ..addListener(() {
        setState(() {});
      });
    scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void toggleSidebar() {
    setState(() {
      isSideBarOpen = !isSideBarOpen;
    });

    isMenuOpenInput.value = !isSideBarOpen; // Reverse the state
    // Reverse the state

    if (isSideBarOpen) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
            body: Stack(
        children: [
          if (isSideBarOpen)
            GestureDetector(
              onTap: toggleSidebar,
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          AnimatedPositioned(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height,
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
            left: isSideBarOpen ? 0 : -MediaQuery.of(context).size.width * 0.8,
            top: 0,
            child: const SideBar(),
          ),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(animation.value * (pi / 180) * -30),
            child: Transform.translate(
              offset: Offset(animation.value * 265, 0),
              child: Transform.scale(
                scale: scaleAnimation.value,
                child: EventExploreView(),
              ),
            ),
          ),
          Positioned(
            left: isSideBarOpen ? 220 : 0,
            top: 16,
            child: MenuBtn(
              press: toggleSidebar,
              riveOnInit: (artboard) {
                final controller = StateMachineController.fromArtboard(
                    artboard, "State Machine");
                artboard.addController(controller!);
                isMenuOpenInput =
                    controller.findInput<bool>("isOpen") as SMIBool;
                isMenuOpenInput.value = !isSideBarOpen;
              },
            ),
          ),
        ],
      ),
    );
  }
}
