import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_course_app/theme/color.dart';

class FeatureItem extends StatelessWidget {
  const FeatureItem({super.key,required this.data, required this.onTap});
  final Map  data;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 270,
        height: 290,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(top: 5, bottom: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: AppColor.shadowColor.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(1, 1))
            ]),
        child: Stack(
          children: [
            Hero(
              tag: data["id"].toString() + data["image"],
              child: SizedBox(
                width: double.infinity,
                height: 190,
                child: CachedNetworkImage(
                    imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover)),
                        ),
                    imageUrl: data["image"]),
              ),
            ),
            Positioned(
              top: 190,
              right: 15,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  data["price"],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            Positioned(
              top: 210,
              child: SizedBox(
                width: 270,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data["name"],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: AppColor.textColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getAttribute(data["session"], Icons.play_circle_outline,
                            AppColor.labelColor),
                        const SizedBox(
                          width: 10,
                        ),
                        getAttribute(data["duration"], Icons.schedule_outlined,
                            AppColor.labelColor),
                        const SizedBox(
                          width: 10,
                        ),
                        getAttribute(data["review"], Icons.star, Colors.yellow)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getAttribute(String info, IconData icon, Color color) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: color,
        ),
        const SizedBox(
          width: 3,
        ),
        Text(info),
      ],
    );
  }
}
