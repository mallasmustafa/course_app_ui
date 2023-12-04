import 'package:flutter/material.dart';
import 'package:online_course_app/theme/color.dart';
import 'package:online_course_app/widgets/custom_image.dart';

class MyCourseItem extends StatelessWidget {
  const MyCourseItem(
      {super.key,
      required this.data,
      this.progressColor = AppColor.blue,
      this.completePercent = 0.0});
  final Map data;
  final Color progressColor;
  final double completePercent;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 0),
            )
          ]),
      child: _buildCourseInfo(),
    );
  }

  Widget _buildCourseInfo() {
    return Row(
      children: [
        CustomImage(
          data["image"],
          radius: 70,
          height: 70,
          width: 70,
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
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: AppColor.textColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              _buildProgressLessonBlock(),
              const SizedBox(
                height: 7,
              ),
              LinearProgressIndicator(
                
                value: data["complete_percent"].toDouble() ?? 0.0,

                backgroundColor: progressColor.withOpacity(0.2),
                valueColor: AlwaysStoppedAnimation<Color>(progressColor),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildProgressLessonBlock() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          data["completed"],
          style: TextStyle(color: progressColor),
        ),
        Visibility(
          visible: data["complete_percent"] < 1,
          child: Text(
            data["progress"],
            style: const TextStyle(color: AppColor.labelColor),
          ),
        )
      ],
    );
  }
}
