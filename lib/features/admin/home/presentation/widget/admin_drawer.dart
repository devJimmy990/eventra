import 'package:eventra/features/landing/cubit/user_cubit.dart';
import 'package:eventra/features/landing/data/model/user.dart';
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
    final User admin = context.read<UserCubit>().user!;
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
              currentAccountPicture: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: admin.avatar?.isEmpty ?? false
                    ? Image.network(
                        admin.avatar!,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        StringsManager.eventImage,
                        fit: BoxFit.cover,
                      ),
              ),
              accountName: Text(admin.name),
              accountEmail: Text(admin.email),
            ),
            // ListTile(
            //   title: Text("Requests"),
            //   leading: Icon(Icons.notifications),
            //   onTap: () {
            //     Navigator.pop(context);
            //     context.pushNamed(AdminRoutes.eventRequests);
            //   },
            // ),
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
