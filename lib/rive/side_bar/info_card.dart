import 'package:eventra/core/constants/extensions.dart';
import 'package:eventra/features/landing/cubit/user_cubit.dart';
import 'package:eventra/features/landing/cubit/user_state.dart';
import 'package:eventra/features/landing/data/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserLoaded) {
          final User user = state.user;
          return ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage:
                  user.avatar != null ? NetworkImage(user.avatar!) : null,
              child: user.avatar == null ? Text(user.name.abbreviate()) : null,
            ),
            title: Text(
              user.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              user.email,
            ),
          );
        }
        if (state is UserError) {
          return Text("Error: ${state.error}");
        }
        return SizedBox();
      },
    );
  }
}
