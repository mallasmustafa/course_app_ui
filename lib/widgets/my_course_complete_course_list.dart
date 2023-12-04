import 'package:flutter/material.dart';
import 'package:online_course_app/widgets/my_course_item.dart';

class MyCourseCompleteCourseList extends StatelessWidget {
  const MyCourseCompleteCourseList(
      {super.key, required this.myCompleteCourses});
  final List myCompleteCourses;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
            myCompleteCourses.length,
            (index) => Padding(
                  padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                  child: MyCourseItem(
                    data: myCompleteCourses[index],
                  ),
                )),
      ),
    );
  }
}
