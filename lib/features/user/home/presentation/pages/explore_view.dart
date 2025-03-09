import 'package:eventra/core/constants/strings_manager.dart';
import 'package:eventra/features/user/home/presentation/widgets/categories_widget.dart';
import 'package:eventra/features/user/home/presentation/widgets/chip_widget.dart';
import 'package:eventra/features/user/home/presentation/widgets/up_coming_widget.dart';
import 'package:eventra/features/user/home/presentation/widgets/user_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: UserDrawer(),
        appBar: AppBar(
          toolbarHeight: 100.h,
          backgroundColor: Colors.blueAccent.shade100,
          iconTheme: IconThemeData(color: Colors.white, size: 30),
          centerTitle: true,
          title: Text(
            "Cairo, Egypt",
            style: TextStyle(
                shadows: [
                  Shadow(
                    offset: Offset(3, 3),
                    blurRadius: 5,
                  ),
                ],
                fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
          ),
          actions: [
            IconButton(
                icon: SvgPicture.asset(StringsManager.notificationsIcon),
                onPressed: () {})
          ],
        ),
        body: Column(
          children: [CategoriesWidget(), UpComingWidget()],
        ));
  }
}
