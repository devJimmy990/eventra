import 'package:eventra/features/admin/extension/string.dart';
import 'package:eventra/features/landing/cubit/user_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/landing/data/model/user.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final User user = context.read<UserCubit>().user!;
    return ListTile(
      leading: CircleAvatar(
        radius: 50,
        backgroundImage:
            user.avatar != null ? NetworkImage(user.avatar!) : null,
        child: user.avatar == null ? Text(user.name.nameAbb()) : null,
      ),
      title: Text(
        user.name,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        user.email,
      ),
    );
  }
}
