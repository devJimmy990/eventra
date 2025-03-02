import 'package:flutter/material.dart';

class GeneralInfoBottomSheet extends StatelessWidget {
  const GeneralInfoBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          spacing: 15,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSection("ACC Address:",
                "U.S. Embassy Cairo, 5 Tawfik Diab Street, Garden City."),
            _buildSection("Opening Hours:",
                "Monday - Thursday, 10:00 AM - 3:00 PM, Closed U.S. and Egyptian holidays."),
            _buildSection("Free Membership",
                "Join us now and get a free membership for 3 months."),
            _buildSection("Special Announcements",
                "Stay tuned for our special announcements."),
            _buildSection("Further Inquiries", "ACCairo@state.gov"),
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
