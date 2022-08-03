import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ubenwa_daniel/utils/colors.dart';
import 'package:ubenwa_daniel/utils/helpers.dart';
import 'package:ubenwa_daniel/utils/screensize.dart';

class ScreenTile extends StatelessWidget {
  final String image, title, subtitle;
  final bool screenvalue;

  ScreenTile(
      {required this.image,
      required this.title,
      required this.subtitle,
      required this.screenvalue});

  @override
  Widget build(BuildContext context) {
    return screenvalue
        ? Stack(
            children: [
              Container(
                  width: Responsive.width(context),
                  height: Responsive.height(context),
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                    // color: AppColors.white,
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Responsive.height(context) / 2,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 5,
                    width: 35,
                  ),
                  SizedBox(height: 20,),
                  Center(
                      child: Container(
                    child: Text(
                      title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: Colors.white),
                    ),
                  )),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                      child: Container(
                    width: 350,
                    child: Text(
                      subtitle,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ))
                ],
              )
            ],
          )
        : Stack(
      children: [
        Container(
            width: Responsive.width(context),
            height: Responsive.height(context),
            child: Image.asset(
              image,
              fit: BoxFit.fill,
              // color: AppColors.white,
            )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Responsive.height(context) / 2,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 5,
              width: 35,
            ),
            SizedBox(height: 20,),
            Center(
                child: Container(
                  child: Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Colors.white),
                  ),
                )),
            SizedBox(
              height: 30,
            ),
            Center(
                child: Container(
                  width: 350,
                  child: Text(
                    subtitle,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ))
          ],
        )
      ],
    );
  }
}
