import 'package:eventra/core/theme/theme_cubit.dart';
import 'package:eventra/core/theme/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text("Welcome to Eventra"),
          ),
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              bool isDark = context.read<ThemeCubit>().isDark;
              return SwitchListTile(
                secondary: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
                title: Text("Switch ${isDark ? "Light" : "Dark"}"),
                value: isDark,
                onChanged: (value) {
                  context.read<ThemeCubit>().toggleTheme();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
