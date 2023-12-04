import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course_app/theme/color.dart';

class CategoryBox extends StatelessWidget {
  const CategoryBox({super.key, required this.data});
  final Map data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColor.shadowColor.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(1, 1),
                )
              ]),
          child: SvgPicture.asset(
            data["icon"],
            width: 30,
            height: 30,
            color: AppColor.textColor,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          data["name"],
          maxLines: 1,
          overflow: TextOverflow.fade,
          style:
              const TextStyle(color: AppColor.textColor, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
