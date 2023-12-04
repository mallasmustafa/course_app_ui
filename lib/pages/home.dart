import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:online_course_app/pages/course_detail.dart';
import 'package:online_course_app/theme/color.dart';
import 'package:online_course_app/utils/data.dart';
import 'package:online_course_app/widgets/category_box.dart';
import 'package:online_course_app/widgets/feature_item.dart';
import 'package:online_course_app/widgets/notification_box.dart';
import 'package:online_course_app/widgets/recommends_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      appBar: getAppBar(),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      backgroundColor: AppColor.appBgColor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Sangvaleap",
                style: TextStyle(color: AppColor.labelColor, fontSize: 14),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Good Morning!",
                style: TextStyle(
                    color: AppColor.textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const NotificationBox(
            notifiedNumber: 1,
          ),
        ],
      ),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getCategories(),
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 10),
            child: Text(
              "Featured",
              style: TextStyle(
                  color: AppColor.textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 22),
            ),
          ),
          getFeatured(),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 25, 15, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Recommended",
                  style: TextStyle(
                      color: AppColor.textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 22),
                ),
                Text(
                  "See all",
                  style: TextStyle(
                      color: AppColor.labelColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ],
            ),
          ),
          getRecommended()
        ],
      ),
    );
  }

  Widget getRecommended() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 15),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          recommends.length,
          (index) => Container(
            margin: const EdgeInsets.only(right: 15, bottom: 5),
            child: RecommendsItem(
              data: recommends[index],
              onTap: () {},
            ),
          ),
        ),
      ),
    );
  }

  Widget getFeatured() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 290,
        enlargeCenterPage: true,
        disableCenter: true,
      ),
      items: List.generate(
        features.length,
        (index) => FeatureItem(
          data: features[index],
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CourseDetailPage(
                  data: {"course": features[index]},
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget getCategories() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categories.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 15),
            child: CategoryBox(data: categories[index]),
          ),
        ),
      ),
    );
  }
}
