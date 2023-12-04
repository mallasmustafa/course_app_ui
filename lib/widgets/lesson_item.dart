import 'package:flutter/material.dart';
import 'package:online_course_app/theme/color.dart';
import 'package:online_course_app/widgets/custom_image.dart';

class LessonItem extends StatelessWidget {
  const LessonItem({super.key, required this.data});
  final Map data;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColor.withOpacity(0.07),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 1),
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomImage(
            data["image"],
            radius: 10,
            width: 70,
            height: 70,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data["name"],
                  style: const TextStyle(
                    color: AppColor.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.schedule_outlined,
                      color: AppColor.labelColor,
                      size: 16,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      data["duration"],
                      style:
                          const TextStyle(color: AppColor.labelColor, fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColor.labelColor,
            size: 15,
          )
        ],
      ),
    );
  }
}
