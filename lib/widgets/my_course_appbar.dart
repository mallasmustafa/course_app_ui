import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course_app/theme/color.dart';
import 'package:online_course_app/widgets/icon_box.dart';

class MyCourseAppBar extends StatelessWidget {
  const MyCourseAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:const [
              Text(
                "My Course",
                style: TextStyle(
                    color: AppColor.textColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        IconBox(
          bgColor: AppColor.appBarColor,
          child: SvgPicture.asset(
            "assets/icons/filter.svg",
            width: 20,
            height: 20,
          ),
        )
      ],
    );
  }
}
