import 'package:eventra/core/routes/routes.dart';

import 'rive_model.dart';

class Menu {
  final String title;
  final RiveModel rive;
  final String routeName; // new property

  Menu({
    required this.title,
    required this.rive,
    required this.routeName,
  });
}

List<Menu> sidebarMenus = [
  Menu(
    title: "Home",
    routeName: UserRoutes.home,
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "HOME",
        stateMachineName: "HOME_interactivity"),
  ),
  Menu(
    title: "Calendar",
    routeName: UserRoutes.calendar,
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "TIMER",
        stateMachineName: "TIMER_Interactivity"),
  ),
  Menu(
    title: "Bookmarks",
    routeName: UserRoutes.bookmark,
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "LIKE/STAR",
        stateMachineName: "STAR_Interactivity"),
  ),
  Menu(
    title: "Contact us",
    routeName: UserRoutes.contact,
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "CHAT",
        stateMachineName: "CHAT_Interactivity"),
  ),
];
List<Menu> sidebarMenus2 = [
    Menu(
    title: "Settings",
    routeName: Routes.settings, //context.pushNamed(Routes.settings)
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "SETTINGS",
        stateMachineName: "SETTINGS_Interactivity"),
  ),
  Menu(
    title: "Contact us",
    routeName: UserRoutes.contact,
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "CHAT",
        stateMachineName: "CHAT_Interactivity"),
  ),
];

List<Menu> bottomNavItems = [
  Menu(
    title: "Timer",
    routeName: UserRoutes.home,
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "TIMER",
        stateMachineName: "TIMER_Interactivity"),
  ),
  Menu(
    title: "Search",
    routeName: UserRoutes.home,
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "SEARCH",
        stateMachineName: "SEARCH_Interactivity"),
  ),
];
