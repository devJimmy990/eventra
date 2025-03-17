import 'package:eventra/core/constants/color_manager.dart';
import 'package:eventra/core/constants/extensions.dart';
import 'package:eventra/core/helper/localization.dart';
import 'package:eventra/features/landing/cubit/user_cubit.dart';
import 'package:eventra/features/landing/cubit/user_state.dart';
import 'package:eventra/features/landing/data/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          return Padding(
            padding: EdgeInsetsDirectional.only(start: 8.w),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                radius: 30,
                backgroundImage:
                    user.avatar != null ? NetworkImage(user.avatar!) : null,
                child:
                    user.avatar == null ? Text(user.name.abbreviate()) : null,
              ),
              title: Text(
                user.name,
                style: TextStyle(
                  color: ColorManager.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                user.email,
                style: TextStyle(
                    color: ColorManager.white, fontStyle: FontStyle.italic),
              ),
            ),
          );
        }
        if (state is UserError) {
          return Text("${Localization.error}: ${state.error}");
        }
        return SizedBox();
      },
    );
  }
}
