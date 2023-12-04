import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_course_app/theme/color.dart';
import 'package:online_course_app/widgets/bookmark_box.dart';

class CourseItem extends StatelessWidget {
  const CourseItem({super.key, required this.data, this.onBookmark});
  final Map data;
  final GestureTapCallback? onBookmark;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 290,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only( bottom: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: AppColor.shadowColor.withOpacity(0.1),
                blurRadius: 1,
                spreadRadius: 1,
                offset: const Offset(1, 1))
          ]),
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: 200,
            child: CachedNetworkImage(
                imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover)),
                    ),
                imageUrl: data["image"]),
          ),
          Positioned(
            top: 175,
            right: 15,
            child: BookMarkBox(
              onTap: onBookmark,
              isBookmarked: data["is_favorited"],
            ),
          ),
          Positioned(
              top: 215,
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 60,
                child: Column(
                  children: [
                    Text(
                      data["name"],
                      style:
                          const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getAttribute(Icons.sell_outlined, data["price"],
                            AppColor.labelColor),
                        getAttribute(Icons.play_circle_outline, data["session"],
                            AppColor.labelColor),
                        getAttribute(Icons.schedule, data["duration"],
                            AppColor.labelColor),
                        getAttribute(Icons.star, data["review"].toString(),
                            AppColor.yellow),
                      ],
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }

  getAttribute(IconData icon, String name, Color color) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: color,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          name,
          style: const TextStyle(fontSize: 13, color: AppColor.labelColor),
        )
      ],
    );
  }
}
