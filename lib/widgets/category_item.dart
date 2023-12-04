import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course_app/theme/color.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key,
      required this.data,
      this.isActive = false,
      this.activeColor = AppColor.primary,
      this.bgColor = Colors.white,
      this.onTap});
  final Map data;
  final Color activeColor;
  final Color bgColor;
  final bool isActive;
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
            color: isActive ? activeColor : bgColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: AppColor.shadowColor.withOpacity(0.05),
                blurRadius: 0.5,
                spreadRadius: 0.5,
                offset: const Offset(1, 1),
              )
            ]),
        child: Row(
          children: [
            SvgPicture.asset(
              data["icon"],
              width: 16,
              height: 16,
              color: isActive ? Colors.white : AppColor.darker,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              data["name"],
              style:
                  TextStyle(color: isActive ? Colors.white : AppColor.darker),
            )
          ],
        ),
      ),
    );
  }
}
