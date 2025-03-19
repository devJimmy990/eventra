import 'package:eventra/core/constants/color_manager.dart';
import 'package:eventra/core/helper/localization.dart';
import 'package:eventra/core/routes/routes.dart';
import 'package:eventra/features/authentication/cubit/auth_cubit.dart';
import 'package:eventra/features/authentication/cubit/auth_state.dart';
import 'package:eventra/features/settings/cubit/settings_cubit.dart';
import 'package:eventra/features/settings/cubit/settings_state.dart';
import 'package:eventra/rive/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'side_bar/info_card.dart';
import 'side_menu.dart';

class SideBar extends StatelessWidget {
  final void Function() onClose;
  final void Function(int) onRoute;
  const SideBar({super.key, required this.onClose, required this.onRoute});

  @override
  Widget build(BuildContext context) {
    final List<Menu> sidebarMenus = [
      Menu(
          title: Localization.userSideHome,
          routeName: UserRoutes.home,
          icon: Iconsax.home_1_outline),
      Menu(
          title: Localization.userSideCalendar,
          routeName: UserRoutes.calendar,
          icon: Iconsax.calendar_1_outline),
      Menu(
          title: Localization.userSideBookmark,
          routeName: UserRoutes.bookmark,
          icon: Iconsax.bookmark_outline),
      Menu(
          title: Localization.userSideProfile,
          routeName: UserRoutes.profile,
          icon: Iconsax.user_outline),
    ];
    final List<Menu> sidebarMenus2 = [
      Menu(
          title: Localization.userSideContact,
          routeName: UserRoutes.contact,
          icon: Iconsax.message_outline),
    ];
    return BlocBuilder<SettingsCubit, SettingsState>(builder: (context, state) {
      return Container(
        width: 288,
        height: double.infinity,
        decoration: const BoxDecoration(color: ColorManager.sideBarLight),
        child: DefaultTextStyle(
          style: const TextStyle(color: Colors.white),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(top: 12.h, end: 12.w),
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.white,
                      child: IconButton(
                          onPressed: onClose,
                          selectedIcon: Icon(Icons.card_travel),
                          icon: Icon(
                            Icons.close,
                            size: 20,
                            color: ColorManager.sideBarLight,
                          )),
                    ),
                  ),
                ),
                InfoCard(),
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                  child: Text(
                    Localization.userSideBrowse.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white70),
                  ),
                ),
                ...sidebarMenus.map((menu) => SideMenu(
                      menu: menu,
                      isActive: menu == sidebarMenus[0],
                      press: () {
                        onRoute(sidebarMenus.indexOf(menu));
                        context.pushNamed(menu.routeName);
                      },
                      icon: menu.icon,
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 40, bottom: 16),
                  child: Text(
                    Localization.userSideHelper.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white70),
                  ),
                ),
                ...sidebarMenus2.map((menu) => SideMenu(
                      menu: menu,
                      press: () {
                        onRoute(4);
                        context.pushNamed(menu.routeName);
                      },
                      icon: menu.icon,
                    )),
                const Spacer(),
                BlocListener<AuthenticationCubit, AuthenticationState>(
                  listener: (context, state) {
                    if (state is UnAuthenticated) {
                      context.goNamed(Routes.auth);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 52, bottom: 42),
                    child: ListTile(
                      onTap: () {
                        context.read<AuthenticationCubit>().logout();
                      },
                      leading: const Icon(Icons.logout, color: Colors.white),
                      title: const Text(
                        "Logout",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
