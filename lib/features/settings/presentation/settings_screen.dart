import 'package:eventra/features/settings/cubit/settings_cubit.dart';
import 'package:eventra/features/settings/cubit/settings_state.dart';
import 'package:eventra/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
              bool isDark = context.read<SettingsCubit>().isDarkTheme;
              return SwitchListTile(
                secondary: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
                title: Text("Switch ${isDark ? "Light" : "Dark"}"),
                value: isDark,
                onChanged: (value) {
                  context.read<SettingsCubit>().toggleTheme();
                },
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.browse_gallery_outlined),
            title:
                Text(SettingsCubit().state.locale == "ar" ? "العربية" : "English"),
            trailing: InkWell(
              onTap: () {
                context.read<SettingsCubit>().toggleLanguage();
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(S.of(context).appName),
                  Icon(Icons.change_circle_outlined),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
