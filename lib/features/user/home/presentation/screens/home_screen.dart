import 'dart:math';
import 'package:eventra/core/constants/color_manager.dart';
import 'package:eventra/core/helper/localization.dart';
import 'package:eventra/features/user/home/presentation/view/calender_view.dart';
import 'package:eventra/features/user/home/presentation/view/explore_view.dart';
import 'package:eventra/rive/btm_nav_item.dart';
import 'package:eventra/rive/menu.dart';
import 'package:eventra/rive/rive_utils.dart';
import 'package:eventra/rive/side_bar.dart';
import 'package:eventra/rive/side_bar/menu_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  late Animation<double> scalAnimation;
  late Animation<double> animation;

  Menu selectedButtonNav = bottomNavItems.first;
  Menu selectedSideMenu = sidebarMenus.first;

  late SMIBool isMenuOpenInput;

  @override
  @override
  void initState() {
    _pageController = PageController();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addListener(
            () {
          setState(() {});
        },
      );
    scalAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
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

  void updateSelectedBtmNav(Menu menu, int index) {
    if (selectedButtonNav != menu) {
      setState(() {
        selectedButtonNav = menu;
        selectedIndex = index;
        _pageController.jumpToPage(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final strings = Localization(context);
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorManager.whiteColor,
      body: Stack(
        children: [
          // Sidebar that slides in/out
          AnimatedPositioned(
            width: 288,
            height: MediaQuery.of(context).size.height,
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            left: isSideBarOpen ? 0 : -288,
            top: 0,
            child: const SideBar(), // Replace with your actual SideBar widget
          ),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(animation.value * (pi / 180) * -30),
            child: Transform.translate(
              offset: Offset(animation.value * 265, 0),
              child: Transform.scale(
                scale: scalAnimation.value,
                child: EventExploreView(),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            left: isSideBarOpen ? 220 : 0,
            top: 16,
            child: MenuBtn(
              press: () {
                // Toggle the menu open state and animate the controller
                isMenuOpenInput.value = !isMenuOpenInput.value;
                if (_animationController.value == 0) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }
                setState(() {
                  isSideBarOpen = !isSideBarOpen;
                });
              },
              riveOnInit: (artboard) {
                final controller = StateMachineController.fromArtboard(
                    artboard, "State Machine");
                artboard.addController(controller!);
                isMenuOpenInput =
                controller.findInput<bool>("isOpen") as SMIBool;
                isMenuOpenInput.value = true;
              },
            ),
          ),
        ],
      ),
      // bottomNavigationBar: Transform.translate(
      //   offset: Offset(0, 100 * animation.value),
      //   child: SafeArea(
      //     child: Container(
      //       width: 3.w,
      //       height: 70.h,
      //       padding: const EdgeInsets.all(12),
      //       margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
      //       decoration: BoxDecoration(
      //         color: ColorManager.backgroundColor2.withOpacity(0.8),
      //         borderRadius: const BorderRadius.all(Radius.circular(24)),
      //         boxShadow: [
      //           BoxShadow(
      //             color: ColorManager.backgroundColor2.withOpacity(0.3),
      //             offset: const Offset(0, 20),
      //             blurRadius: 20,
      //           ),
      //         ],
      //       ),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           ...List.generate(
      //             bottomNavItems.length,
      //                 (index) {
      //               Menu navBar = bottomNavItems[index];
      //               return BtmNavItem(
      //                 navBar: navBar,
      //                 press: () {
      //                   RiveUtils.chnageSMIBoolState(navBar.rive.status!);
      //                   updateSelectedBtmNav(navBar, index);
      //                 },
      //                 riveOnInit: (artboard) {
      //                   navBar.rive.status = RiveUtils.getRiveInput(artboard,
      //                       stateMachineName: navBar.rive.stateMachineName);
      //                 },
      //                 selectedNav: selectedButtonNav,
      //               );
      //             },
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
