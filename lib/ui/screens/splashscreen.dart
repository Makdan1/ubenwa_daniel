import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ubenwa_daniel/core/services/activities_service.dart';
import 'package:ubenwa_daniel/utils/locator.dart';
import 'package:ubenwa_daniel/utils/router/navigation_service.dart';
import 'package:ubenwa_daniel/utils/router/route_names.dart';
import 'package:ubenwa_daniel/utils/screensize.dart';

class AnimatedSplashScreen extends StatefulWidget {
  const AnimatedSplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<AnimatedSplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;
  final NavigationService _navigationService = locator<NavigationService>();
  late AnimationController animationController;
  late Animation<double> animation;
  final Activities _authentication = locator<Activities>();
  startTime() async {
    var _duration = const Duration(milliseconds: 2500);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var id = prefs.getString('profile');
    if (id != null) {
      //_navigationService.navigateReplacementTo(loginRoute);
      _authentication.alreadyLoggedIn();
    } else {
      _navigationService.navigateReplacementTo(loginRoute);
      //_navigationService.navigateReplacementTo(WelcomeScreenRoute);
      // _navigationService.navigateReplacementTo(loginRoute);
    }
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: Responsive.width(context),
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xddFFE5D6),
              Color(0xddDEF0FC),
             // Color(0xaa85D3FF),

              // Color(0xff2596D7),
            ],
            stops: [
              0.4,
              0.9,
             //0.9,
            ],
            tileMode: TileMode.clamp,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  width: animation.value * 300,
                  child: Text(
                    "Test App",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ))
            ],
          )),
    );
  }
}
