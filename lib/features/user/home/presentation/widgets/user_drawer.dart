import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventra/core/routes/routes.dart';
import 'package:eventra/features/landing/data/model/user.dart';
import 'package:eventra/features/landing/cubit/user_cubit.dart';
import 'package:eventra/features/authentication/cubit/auth_cubit.dart';
import 'package:eventra/features/authentication/cubit/auth_state.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = context.read<UserCubit>().user;
    return user != null ? _BuildUserDrawer(user) : _BuildEmptyDrawer();
  }
}

class _BuildUserDrawer extends StatelessWidget {
  final User user;
  const _BuildUserDrawer(this.user);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: BlocListener<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            Fluttertoast.showToast(
              msg: "logged out",
              textColor: Colors.white,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              toastLength: Toast.LENGTH_SHORT,
            );
            context.goNamed(Routes.auth);
          }
        },
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(user.avatar ?? "")),
              accountName: Text(user.name),
              accountEmail: Text(user.email),
            ),
            ListTile(
              title: Text("Bookmarks"),
              leading: Icon(Icons.bookmark),
              onTap: () {
                Navigator.pop(context);
                context.pushNamed(UserRoutes.contact);
              },
            ),
            ListTile(
              title: Text("Profile"),
              leading: Icon(Icons.person),
              onTap: () {
                Navigator.pop(context);
                context.pushNamed(UserRoutes.contact);
              },
            ),
            Spacer(),
            ListTile(
              title: Text("Contact us"),
              leading: Icon(Icons.support_agent_outlined),
              onTap: () {
                Navigator.pop(context);
                context.pushNamed(UserRoutes.contact);
              },
            ),
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

class _BuildEmptyDrawer extends StatelessWidget {
  const _BuildEmptyDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
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
            title: Text("login"),
            leading: Icon(Icons.logout),
            onTap: () => context.push(Routes.auth),
          ),
        ],
      ),
    );
  }
}
