import 'package:flutter/material.dart';
import 'package:online_course_app/theme/color.dart';

class ChatAppBar extends StatelessWidget {
  const ChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:const [
        Text(
          "Chat",
          style: TextStyle(
            fontSize: 28,
            color: AppColor.textColor,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
