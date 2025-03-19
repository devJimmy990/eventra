import 'dart:math';
import 'package:eventra/core/constants/color_manager.dart';
import 'package:eventra/core/helper/localization.dart';
import 'package:eventra/features/settings/cubit/settings_cubit.dart';
import 'package:eventra/features/settings/cubit/settings_state.dart';
import 'package:eventra/features/user/bookmarks/presentation/screens/bookmark_screen.dart';
import 'package:eventra/features/user/contact-us/screens/contact_us_screen.dart';
import 'package:eventra/features/user/home/presentation/view/calender_view.dart';
import 'package:eventra/features/user/home/presentation/view/explore_view.dart';
import 'package:eventra/features/user/profile/profile_screen.dart';
import 'package:eventra/rive/side_bar.dart';
import 'package:eventra/rive/side_bar/menu_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen>
    with SingleTickerProviderStateMixin {
  bool isSideBarOpen = false;
  late AnimationController _animationController;
  late Animation<double> scaleAnimation;
  late Animation<double> animation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..addListener(() {
        setState(() {});
      });
    scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  void toggleSidebar() {
    setState(() {
      isSideBarOpen = !isSideBarOpen;
    });


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
      appBar: isSideBarOpen
          ? null
          : AppBar(
              automaticallyImplyLeading: false,
              leading: MenuBtn(
                press: toggleSidebar,
              ),
              backgroundColor: ColorManager.sideBarLight,
              toolbarHeight: 80.h,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  bottomRight: Radius.circular(28),
                ),
              ),
              centerTitle: true,
              title: Text(
                Localization.userHomeAppBar,
                style: const TextStyle(
                  shadows: [
                    Shadow(
                      offset: Offset(3, 3),
                      blurRadius: 5,
                    ),
                  ],
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          if (state is SettingsLoadedState) {
            return Stack(
              children: [
                AnimatedPositionedDirectional(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.fastOutSlowIn,
                  start: isSideBarOpen
                      ? 0
                      : -MediaQuery.of(context).size.width * 0.8,
                  top: 0,
                  child: SideBar(
                    onClose: () {
                      toggleSidebar();
                    },
                    onRoute: (index) {
                      setState(() {
                        toggleSidebar();
                      });
                    },
                  ),
                ),
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(animation.value * (pi / 180) * -30),
                  child: Transform.translate(
                    offset: Offset(
                        animation.value * (state.locale == "en" ? 260 : -260),
                        0),
                    child: Transform.scale(
                      scale: scaleAnimation.value,
                      child: EventExploreView(),
                    ),
                  ),
                ),
              ],
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

final List<Widget> pages = [
  EventExploreView(),
  EventCalendarView(),
  BookmarkScreen(),
  UserProfileScreen(),
  ContactUsScreen()
];
