import 'package:eventra/core/constants/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'chip_widget.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 80.h,
            ),
            Container(
              height: 50.h,
              decoration: BoxDecoration(
                  color: Colors.blueAccent.shade100,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(40.r),
                  )),
            ),
            Positioned(
              left: 20,
              right: 20,
              top: 20,
              child: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ChipWidget(
                          image: StringsManager.sportsIcon,
                          text: "Sports",
                          color: Colors.redAccent.shade100),
                      ChipWidget(
                          image: StringsManager.musicIcon,
                          text: "Music",
                          color: Colors.orangeAccent.shade100),
                      ChipWidget(
                          image: StringsManager.foodIcon,
                          text: "Food",
                          color: Colors.greenAccent.shade100),
                      ChipWidget(
                          image: StringsManager.artIcon,
                          text: "Art",
                          color: Colors.blue.shade100),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
