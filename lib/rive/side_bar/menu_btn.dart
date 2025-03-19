import 'package:eventra/core/constants/color_manager.dart';
import 'package:eventra/features/settings/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuBtn extends StatelessWidget {
  const MenuBtn({super.key, required this.press});

  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IconButton(
        onPressed: press,
        icon: CircleAvatar(
          backgroundColor: Colors.white,
          child: RotatedBox(
              quarterTurns:
                  context.read<SettingsCubit>().locale == "en" ? 0 : 2,
              child: Icon(Icons.menu, color: ColorManager.sideBarLight,size: 32,)),
        ),
      ),
    );
  }
}
