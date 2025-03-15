import 'package:eventra/core/helper/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GeneralInfoBottomSheet extends StatelessWidget {
  const GeneralInfoBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
        child: Column(
          spacing: 15,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSection(
                Localization.userContactAddress, Localization.userContactAddressInfo),
            _buildSection(Localization.userContactTime, Localization.userContactTimeInfo),
            _buildSection(Localization.userContactMembership,
                Localization.userContactMembershipInfo),
            _buildSection(Localization.userContactAnnouncements,
                Localization.userContactAnnouncementsInfo),
            _buildSection(
                Localization.userContactInquiry, Localization.userContactInquiryInfo),
          ],
        ),
      ),
    );
  }
}

// Widget _buildTitle(String title) {
//   return Row(
//     children: [
//       Icon(
//         Bootstrap.dot,
//         size: 32,
//       ),
//       Text(
//         title,
//         style: TextStyle(
//           fontWeight: FontWeight.bold,
//           fontSize: 22,
//           color: Colors.black87,
//         ),
//       ),
//     ],
//   );
// }

Widget _buildSection(String title, String desc) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 20,
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        desc,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.black54,
        ),
      ),
    ],
  );
}
