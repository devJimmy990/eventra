import 'package:eventra/core/constants/strings_manager.dart';
import 'package:eventra/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(
                StringsManager.eventImage,
              ),
            ),
            accountName: Text("Ahmed Admin"),
            accountEmail: Text("A.Roshdy@gmail.com"),
          ),
          ListTile(
            title: Text("Requests"),
            leading: Icon(Icons.notifications),
            onTap: () {
              Navigator.pop(context);
              context.pushNamed(AdminRoutes.eventRequests);
            },
          ),
          Spacer(),
          ListTile(
            title: Text("Settings"),
            leading: Icon(Icons.settings),
            onTap: () {
              Navigator.pop(context);
              context.pushNamed(Routes.settings);
            },
          ),
          ListTile(
            title: Text("Logout"),
            leading: Icon(Icons.logout),
            onTap: () => context.goNamed(Routes.login),
          ),
        ],
      ),
    );
  }
}
