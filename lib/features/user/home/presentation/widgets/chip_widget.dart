import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChipWidget extends StatelessWidget {
  ChipWidget({super.key, required this.text, required this.color,required this.image});
  String text;
  Color color;
  String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  REdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.r),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4.r)],
        ),
        child: Chip(
          shadowColor: Colors.black12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
            side: BorderSide(
              color: Colors.transparent
            )
          ),
          label: Padding(
            padding: REdgeInsets.all(4.0),
            child: Row(
              children: [
                SizedBox(
                  height: 16.h,
                    child: SvgPicture.asset(image)),
                SizedBox(width: 3.w,),
                Text(text,
                style: TextStyle(
                  shadows: [
                    Shadow(
                      offset: Offset(3, 3),
                      blurRadius: 3.r,
                    ),
                  ],
                  color: Colors.white,
                  fontSize: 18.sp
                ),),
              ],
            ),
          ),
          backgroundColor: color,
        ),
      ),
    );
  }
}
