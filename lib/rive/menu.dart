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
