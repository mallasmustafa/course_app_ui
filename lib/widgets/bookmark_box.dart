import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_course_app/theme/color.dart';

class BookMarkBox extends StatelessWidget {
  const BookMarkBox({super.key, this.onTap, this.isBookmarked = false});
  final GestureTapCallback? onTap;
  final bool isBookmarked;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: isBookmarked ? AppColor.primary : Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: AppColor.shadowColor.withOpacity(0.05),
                  spreadRadius: 0.5,
                  blurRadius: 0.5,
                  offset: const Offset(1, 1))
            ]),
        child: SvgPicture.asset(
          "assets/icons/bookmark.svg",
          color: isBookmarked ? Colors.white : AppColor.primary,
          width: 25,
          height: 25,
        ),
      ),
    );
  }
}
