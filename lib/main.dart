import 'package:shared_preferences/shared_preferences.dart';
import 'package:ubenwa_daniel/core/model/CreateNewBornModel.dart';
import 'package:ubenwa_daniel/ui/screens/home/home_view_model.dart';
import 'package:ubenwa_daniel/utils/locator.dart';
import 'package:ubenwa_daniel/ui/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ubenwa_daniel/utils/progressBarManager/dialog_manager.dart';
import 'package:ubenwa_daniel/utils/progressBarManager/dialog_service.dart';
import 'package:ubenwa_daniel/utils/router/navigation_service.dart';
import 'package:ubenwa_daniel/utils/router/router.dart';
import 'package:background_fetch/background_fetch.dart';

void backgroundFetchHeadlessTask(HeadlessTask task) async {
  String taskId = task.taskId;
  bool isTimeout = task.timeout;
  if (isTimeout) {
    // This task has exceeded its allowed running-time.
    // You must stop what you're doing and immediately .finish(taskId)
    print("[BackgroundFetch] Headless task timed-out: $taskId");
    BackgroundFetch.finish(taskId);
    return;
  }
  print('[BackgroundFetch] Headless event received.');
  // Do your work here...
  BackgroundFetch.finish(taskId);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const MyApp());
  BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late BuildContext contextB;
  bool _enabled = false;
  int _status = 0;
  List<DateTime> _events = [];
  HomeViewModel model = HomeViewModel();
  @override
  void initState() {
    super.initState();
    initPlatformState();
    _onStart();
  }

// Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // Configure BackgroundFetch.
    int status = await BackgroundFetch.configure(
        BackgroundFetchConfig(
            minimumFetchInterval: 20,
            stopOnTerminate: false,
            enableHeadless: true,
            requiresBatteryNotLow: false,
            requiresCharging: false,
            requiresStorageNotLow: false,
            requiresDeviceIdle: false,
            requiredNetworkType: NetworkType.NONE), (String taskId) async {
      // <-- Event handler
      // This is the fetch-event callback.
      print("[BackgroundFetch] Event received $taskId");
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        var id =   prefs.getString('background');
        if (id != null) {
          _enabled = true;
        } else {
          _enabled = false;
        }
      });
      if (_enabled) {
        setState(() {
          model.createNewBorn(CreateNewBornModel(
              data: Data(
                  type: "newborns",
                  attributes: Attributes(
                    name: "John",
                    gestation: DateTime.now().toString(),
                    gender: "male",
                  ))));

          _events.insert(0, new DateTime.now());
        });
      }
      // IMPORTANT:  You must signal completion of your task or the OS can punish your app
      // for taking too long in the background.
      BackgroundFetch.finish(taskId);
    }, (String taskId) async {
      // <-- Task timeout handler.
      // This task has exceeded its allowed running-time.  You must stop what you're doing and immediately .finish(taskId)
      print("[BackgroundFetch] TASK TIMEOUT taskId: $taskId");
      BackgroundFetch.finish(taskId);
    });
    print('[BackgroundFetch] configure success: $status');
    setState(() {
      _status = status;
    });

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }

  void _onStart() async {

      BackgroundFetch.start().then((int status) {
        print('[BackgroundFetch] start success: $status');
      }).catchError((e) {
        print('[BackgroundFetch] start FAILURE: $e');
      });
  //  } else {
  //     BackgroundFetch.stop().then((int status) {
  //       print('[BackgroundFetch] stop success: $status');
  //     });
  //   }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UbenmaDaniel',
      builder: (context, child) => Navigator(
        key: locator<ProgressService>().progressNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(builder: (context) {
          return ProgressManager(child: child!);
        }),
      ),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF7F8FC),
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      navigatorKey: locator<NavigationService>().navigationKey,
      home: const AnimatedSplashScreen(),
      onGenerateRoute: generateRoute,
    );
  }
}
