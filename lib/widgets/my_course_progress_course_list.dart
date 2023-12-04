import 'package:flutter/material.dart';
import 'package:online_course_app/widgets/my_course_item.dart';

class MyCourseProgressCourseList extends StatelessWidget {
  const MyCourseProgressCourseList(
      {super.key, required this.myProgressCourses});
  final List myProgressCourses;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(myProgressCourses.length, (index) => Padding(
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
          child: MyCourseItem(
            data: myProgressCourses[index],
          ),
        )),
      ),
    );
  }
}
