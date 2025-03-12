import 'package:eventra/core/helper/localization.dart';
import 'package:eventra/features/authentication/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminProfileView extends StatelessWidget {
  const AdminProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final Localization strings = Localization(context);
    return Column(
      children: [
        ListTile(
          title: Text(strings.logout),
          leading: Icon(Icons.logout),
          onTap: () => context.read<AuthenticationCubit>().logout(),
        ),
      ],
    );
  }
}
