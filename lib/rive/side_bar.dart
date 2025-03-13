import 'package:eventra/core/routes/routes.dart';
import 'package:eventra/rive/menu.dart';
import 'package:eventra/rive/rive_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'side_bar/info_card.dart';
import 'side_menu.dart';

class SideBar extends StatefulWidget {
  final VoidCallback  closeSideBar;

  const SideBar({super.key, required this.closeSideBar});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  Menu selectedSideMenu = sidebarMenus.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 288,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFF17203A),
      ),
      child: DefaultTextStyle(
        style: const TextStyle(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32.h),
            InfoCard(),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
              child: Text(
                "Browse".toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white70),
              ),
            ),
            ...sidebarMenus.map((menu) => SideMenu(
                  menu: menu,
                  selectedMenu: selectedSideMenu,
                  press: () {
                    context.pushNamed(menu.routeName);
                    RiveUtils.chnageSMIBoolState(menu.rive.status!);
                    setState(() {
                      selectedSideMenu = menu;
                    });
                  },
                  riveOnInit: (artboard) {
                    menu.rive.status = RiveUtils.getRiveInput(artboard,
                        stateMachineName: menu.rive.stateMachineName);
                  },
                )),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 40, bottom: 16),
              child: Text(
                "Helper".toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white70),
              ),
            ),
            ...sidebarMenus2.map((menu) => SideMenu(
                  menu: menu,
                  selectedMenu: selectedSideMenu,
                  press: () {
                    widget.closeSideBar();

                    context.pushNamed(menu.routeName);
                    RiveUtils.chnageSMIBoolState(menu.rive.status!);
                    setState(() {
                      selectedSideMenu = menu;
                    });
                  },
                  riveOnInit: (artboard) {
                    menu.rive.status = RiveUtils.getRiveInput(artboard,
                        stateMachineName: menu.rive.stateMachineName);
                  },
                )),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 24, bottom: 32),
              child: ListTile(
                onTap: () {
                  widget.closeSideBar();
                  // Insert your logout logic here.
                  // For demonstration, we navigate to the login screen.
                  context.goNamed(Routes.auth);
                },
                leading: const Icon(Icons.logout, color: Colors.white),
                title: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
