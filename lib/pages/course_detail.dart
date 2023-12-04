import 'package:flutter/material.dart';
import 'package:online_course_app/theme/color.dart';
import 'package:online_course_app/utils/data.dart';
import 'package:online_course_app/widgets/bookmark_box.dart';
import 'package:online_course_app/widgets/custom_button.dart';
import 'package:online_course_app/widgets/custom_image.dart';
import 'package:online_course_app/widgets/lesson_item.dart';
import 'package:readmore/readmore.dart';

class CourseDetailPage extends StatefulWidget {
  const CourseDetailPage({super.key, required this.data});
  final Map data;

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  // ignore: prefer_typing_uninitialized_variables
  late var courseData;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    courseData = widget.data["course"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: buildBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: AppColor.appBgColor,
      title: const Text(
        "Detail",
        style: TextStyle(
          color: AppColor.textColor,
        ),
      ),
      iconTheme: const IconThemeData(color: AppColor.textColor),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
      child: Column(
        children: [
          Hero(
            tag: courseData["id"].toString() + courseData["image"],
            child: CustomImage(
              courseData["image"],
              radius: 10,
              width: double.infinity,
              height: 200,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          getInfo(),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            thickness: 2,
          ),
          getTabBar(),
          getTabbarPages()
        ],
      ),
    );
  }

  Widget getTabBar() {
    return TabBar(
        indicatorColor: AppColor.primary,
        controller: tabController,
        tabs: const[
           Tab(
            child: Text(
              "Lessons",
              style: TextStyle(fontSize: 16, color: AppColor.textColor),
            ),
          ),
           Tab(
            child: Text(
              "Excercises",
              style: TextStyle(fontSize: 16, color: AppColor.textColor),
            ),
          ),
        ]);
  }

  Widget getTabbarPages() {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: tabController,
          children: [
            getLessons(),
            const Center(child: Text("Excercises")),
          ]),
    );
  }

  Widget getLessons() {
    return ListView.builder(
        itemCount: lessons.length,
        itemBuilder: (context, index) => LessonItem(data: lessons[index]));
  }

  Widget getInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              courseData["name"],
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColor.textColor),
            ),
            BookMarkBox(
              isBookmarked: courseData["is_favorited"],
              onTap: () {
                setState(() {
                  courseData["is_favorited"] = !courseData["is_favorited"];
                });
              },
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            getAttribute(Icons.play_circle_outline, courseData["session"],
                AppColor.labelColor),
            const SizedBox(
              width: 20,
            ),
            getAttribute(Icons.schedule_outlined, courseData["duration"],
                AppColor.labelColor),
            const SizedBox(
              width: 20,
            ),
            getAttribute(Icons.star, courseData["review"], AppColor.yellow),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "About Course",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColor.textColor),
            ),
            const SizedBox(
              height: 10,
            ),
            ReadMoreText(
              courseData["description"],
              trimLines: 2,
              trimMode: TrimMode.Line,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColor.labelColor),
              trimCollapsedText: "Show more",
              moreStyle: const TextStyle(
                  fontSize: 14,
                  color: AppColor.primary,
                  fontWeight: FontWeight.w500),
              lessStyle: const TextStyle(
                  color: AppColor.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            )
          ],
        )
      ],
    );
  }

  Widget getAttribute(IconData icon, String info, Color color) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: color,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          info,
          style: const TextStyle(
            color: AppColor.labelColor,
          ),
        )
      ],
    );
  }

  Widget getFooter() {
    return Container(
      height: 80,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: AppColor.shadowColor.withOpacity(0.05),
              blurRadius: 1,
              spreadRadius: 1,
              offset: const Offset(0, 0)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "price",
                style: TextStyle(
                    fontSize: 16,
                    color: AppColor.labelColor,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                courseData["price"],
                style: const TextStyle(
                    color: AppColor.textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: CustomButton(title: "Buy Now", onTap: () {}),
          ),
        ],
      ),
    );
  }
}
