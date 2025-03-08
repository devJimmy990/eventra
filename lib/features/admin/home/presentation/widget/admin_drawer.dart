import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventra/core/routes/routes.dart';
import 'package:eventra/core/constants/strings_manager.dart';
import 'package:eventra/features/authentication/cubit/auth_cubit.dart';
import 'package:eventra/features/authentication/cubit/auth_state.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: BlocListener<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            context.goNamed(Routes.auth);
          }
        },
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
              onTap: () => context.read<AuthenticationCubit>().logout(),
            ),
          ],
        ),
      ),
    );
  }
}
