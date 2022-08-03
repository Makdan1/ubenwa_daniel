import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ubenwa_daniel/core/model/NewBornList.dart';
import 'package:ubenwa_daniel/utils/colors.dart';

class BornItem extends StatelessWidget {
  final NewBornList feed;
  BornItem({required this.feed});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.grey.withOpacity(0.1),
        ),
        height: 90,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(children: [
                Container(
                    color: Colors.white,
                    height: 50,
                    width: 50,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Center(
                            child: Text(feed.id != null ? feed.id! : "",
                                style:
                                    TextStyle(fontWeight: FontWeight.bold))))),
                SizedBox(
                  width: 10,
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            feed.attributes!.name != null
                                ? feed.attributes!.name!
                                : "",
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 5,
                          ),

                          //   Text(DateFormat('d MMM, y hh:mm a').format(DateTime.parse(feed.data!.attributes!.createdAt! ),
                          Text(
                            "${DateFormat('d MMM').format(DateTime.parse(feed.attributes!.createdAt!))} | ${DateFormat('hh:mm a').format(DateTime.parse(feed.attributes!.createdAt!))}",
                            style: const TextStyle(
                              color: AppColors.grey,
                              fontSize: 13,
                            ),
                          ),
                        ])),
              ]),
              Text(
                feed.attributes!.gender != null
                    ? feed.attributes!.gender!.toUpperCase()
                    : "",
                style: TextStyle(),
              ),
            ]));
  }
}
