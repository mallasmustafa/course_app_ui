import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course_app/theme/color.dart';

class BootomBarItem extends StatelessWidget {
  const BootomBarItem({
    super.key,
    required this.icon,
    this.activeColor = AppColor.primary,
    this.color = Colors.grey,
    this.isActive = false,
    this.onTap,
  });

  final String icon;
  final Color activeColor;
  final bool isActive;
  final Color color;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: AppColor.bottomBarColor,
            boxShadow: [
              if (isActive)
                BoxShadow(
                    color: AppColor.shadowColor.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: const Offset(0, 0)),
            ]),
        child: SvgPicture.asset(
          icon,
          color: isActive ? activeColor : color,
        ),
      ),
    );
  }
}
