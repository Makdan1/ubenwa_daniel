import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:ubenwa_daniel/core/model/NewBornList.dart';
import 'package:ubenwa_daniel/core/services/auth_service.dart';
import 'package:ubenwa_daniel/ui/screens/home/home_view_model.dart';
import 'package:ubenwa_daniel/ui/widget/born_widget.dart';
import 'package:ubenwa_daniel/utils/colors.dart';
import 'package:ubenwa_daniel/utils/locator.dart';
import 'package:ubenwa_daniel/utils/router/navigation_service.dart';
import 'package:ubenwa_daniel/utils/router/route_names.dart';
import 'package:ubenwa_daniel/utils/screensize.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ubenwa_daniel/utils/tiny_db.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Home> with TickerProviderStateMixin {
  final Authentication _authentication = locator<Authentication>();
  late bool active = false;
  AnimationController? _navController;
  Animation<Offset>? _navAnimation;
  bool? enableBackground = false;

  backgroundUpload() async {
    if (enableBackground!) {
      setState(() {
        enableBackground = false;
      });
      SharedPreferences prefs;
      prefs = await SharedPreferences.getInstance();
      setState(()  {
         prefs.remove('background');
      });
    } else {
      SharedPreferences prefs;
      prefs = await SharedPreferences.getInstance();
      setState(() {
        enableBackground = true;
      });
      setState(()  {
         prefs.setString('background', "yes");
      });
    }
  }

  @override
  void initState() {
    super.initState();

    _navController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..forward();
    _navAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.99),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _navController!,
      curve: Curves.easeIn,
    ));
  }

  @override
  void dispose() {
    _navController!.dispose();
    super.dispose();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final NavigationService _navigationService = locator<NavigationService>();
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();
  HomeViewModel model = HomeViewModel();
  Future<List<NewBornList>>? refresh;

  Future<void> _handleRefresh() {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 2), () {
      completer.complete();
    });

    setState(() {
      refresh = model.getNewBorn();
    });
    return completer.future.then<void>((_) {});
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        onModelReady: (v) async {
          // v.createNewBorn(CreateNewBornModel(
          //     data: Data(
          //         type: "newborns",
          //         attributes: Attributes(
          //           name: _authentication.currentUser.userInfo!.firstName,
          //           gestation: DateTime.now().toString(),
          //           gender: "male",
          //         ))));
          refresh = model.getNewBorn();
          SharedPreferences prefs = await SharedPreferences.getInstance();
          setState(() {
            var id = prefs.getString('background');
            id != null ? enableBackground = true : enableBackground = false;
          });
        },
        viewModelBuilder: () => HomeViewModel(),
        builder: (context, model, child) {
          return Scaffold(
              key: _scaffoldKey,
              body: LiquidPullToRefresh(
                  key: _refreshIndicatorKey,
                  onRefresh: _handleRefresh,
                  color: AppColors.secondaryColor,
                  showChildOpacityTransition: false,
                  child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(children: [
                              SizedBox(
                                height: 60,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Hello ${_authentication.currentUser.userInfo!.firstName!}",
                                    // "${_authentication.currentUser.userInformation!.firstName},",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 24),
                                  ),
                                ],
                              ),
                              AnimationLimiter(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children:
                                        AnimationConfiguration.toStaggeredList(
                                            duration: const Duration(
                                                milliseconds: 1000),
                                            childAnimationBuilder: (widget) =>
                                                SlideAnimation(
                                                  horizontalOffset:
                                                      -MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          4,
                                                  child: FadeInAnimation(
                                                      curve:
                                                          Curves.fastOutSlowIn,
                                                      child: widget),
                                                ),
                                            children: [
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "Background upload",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  CupertinoSwitch(
                                                      activeColor: AppColors
                                                          .secondaryColor,
                                                      value: enableBackground!,
                                                      onChanged: (v) {
                                                        backgroundUpload();
                                                      })
                                                ],
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    TinyDb.removeAll();
                                                    _navigationService.pushAndRemoveUntil(loginRoute);
                                                  },
                                                  icon: Icon(Icons.logout))
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            height: Responsive.height(context) /
                                                1.2,
                                            child: FutureBuilder<
                                                    List<NewBornList>>(
                                                future: refresh,
                                                builder: (context, snapshot) {
                                                  if (!snapshot.hasData) {
                                                    return Container(
                                                        height: 400,
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 20.0,
                                                                right: 20),
                                                        child: Center(
                                                          child: Shimmer
                                                              .fromColors(
                                                                  direction:
                                                                      ShimmerDirection
                                                                          .ltr,
                                                                  period: Duration(
                                                                      seconds:
                                                                          2),
                                                                  child:
                                                                      ListView(
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    // shrinkWrap: true,
                                                                    children: [
                                                                      0,
                                                                      1,
                                                                      2,
                                                                      3
                                                                    ]
                                                                        .map((_) =>
                                                                            Padding(
                                                                              padding: const EdgeInsets.all(8.0),
                                                                              child: Row(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Column(
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Container(
                                                                                          width: double.infinity,
                                                                                          height: 8.0,
                                                                                          color: Colors.white,
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                                                                                        ),
                                                                                        Container(
                                                                                          width: double.infinity,
                                                                                          height: 8.0,
                                                                                          color: Colors.white,
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                                                                                        ),
                                                                                        Container(
                                                                                          width: 40.0,
                                                                                          height: 8.0,
                                                                                          color: Colors.white,
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            ))
                                                                        .toList(),
                                                                  ),
                                                                  baseColor: AppColors
                                                                      .grey
                                                                      .withOpacity(
                                                                          0.5),
                                                                  highlightColor:
                                                                      Colors
                                                                          .white),
                                                        ));
                                                  } else if (snapshot
                                                      .data!.isNotEmpty) {
                                                    return ListView(
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        // shrinkWrap: true,
                                                        children: snapshot.data!
                                                            .map(
                                                              (feed) =>
                                                                  BornItem(
                                                                feed: feed,
                                                              ),
                                                            )
                                                            .toList());
                                                  } else if (snapshot
                                                      .hasError) {
                                                    return Center(
                                                        child: Column(
                                                      children: <Widget>[
                                                        SizedBox(
                                                          height: 100,
                                                        ),
                                                        Text(
                                                          'Network error',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text('Network error'),
                                                        SizedBox(
                                                          height: 100,
                                                        ),
                                                      ],
                                                    ));
                                                  } else {
                                                    return Center(
                                                        child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "Looks like you haven’t added any new born, kindly toggle the background upload at the top to start, if that is done already kindly drag this page down to refresh page",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color: AppColors
                                                                  .grey),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                      ],
                                                    ));
                                                  }
                                                }),
                                          )
                                        ])),
                              )
                            ]))
                      ]))));
        });
  }
}
