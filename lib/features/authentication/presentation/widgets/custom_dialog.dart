import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key, required this.content, required this.onTap});
  final Widget content;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        icon: Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close_rounded,
                color: Colors.black,
              )),
        ),
        content: content,
        actions: [
          TextButton(
            onPressed: onTap,
            child: Text(
              "OK",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          )
        ]);
  }
}
