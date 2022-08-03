import 'dart:convert';
import 'package:ubenwa_daniel/core/model/NewBornList.dart';
import 'package:ubenwa_daniel/core/model/SignInResponse.dart';
import 'package:ubenwa_daniel/core/model/auth_model.dart';
import 'package:ubenwa_daniel/core/model/error_model.dart';
import 'package:ubenwa_daniel/core/model/success_model.dart';
import 'package:ubenwa_daniel/core/services/index.dart';
import 'package:ubenwa_daniel/utils/helpers.dart';
import 'package:ubenwa_daniel/utils/http/paths.dart';
import 'package:ubenwa_daniel/utils/locator.dart';
import 'package:ubenwa_daniel/utils/router/navigation_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ubenwa_daniel/utils/router/route_names.dart';

class Authentication {
  final NavigationService _navigationService = locator<NavigationService>();

  late SignInResponse _currentUser;
  SignInResponse get currentUser => _currentUser;

  late AuthModel _token;
  AuthModel get token => _token;

  login(Map<dynamic, dynamic> payload) async {
    try {
      final result = await http.post(Paths.login, payload);
      if (result is ErrorModel) {
        return ErrorModel(result.error);
      }

      final AuthModel auth = AuthModel.fromJson(result.data['token']);
      _token = auth != null ? auth : AuthModel.fromJson("token");
      SignInResponse user = SignInResponse.fromJson(result.data);
      showToast("Login Successfully");
      _currentUser = user;
      SharedPreferences prefs;
      prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', auth.token);
      await prefs.setString("profile", json.encode(user));
      return SuccessModel(user);
    } catch (e) {
      print(e);
      return ErrorModel(e.toString() ==
              "SocketException: Failed host lookup: '$baseUrlError' (OS Error: nodename nor servname provided, or not known, errno = 8)"
          ? "Your internet is not stable kindly reconnect and try again"
          : e.toString() ==
                  "TimeoutException after 0:00:40.000000: Future not completed"
              ? "Your internet is not stable kindly reconnect and try again"
              : 'Login failed, try again.');
    }
  }

  alreadyLoggedIn() async {
    SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    var d = prefs.getString('profile');
    SignInResponse user = SignInResponse.fromJson(json.decode(d!));
    _currentUser = user;
    var t = prefs.getString('token');
    final AuthModel auth = AuthModel.fromJson(t!);
    _token = auth;
    _navigationService.navigateReplacementTo(HomeRoute);
    return SuccessModel(user);
  }

  signUp(Map<dynamic, dynamic> payload) async {
    try {
      final result = await http.post(Paths.signUp, payload);
      if (result is ErrorModel) {
        return ErrorModel(result.error);
      }
      showToast("Registration Successful");

      return SuccessModel(result.data);
    } catch (e) {
      return ErrorModel(e.toString() ==
              "SocketException: Failed host lookup: '$baseUrlError' (OS Error: nodename nor servname provided, or not known, errno = 8)"
          ? "Your internet is not stable kindly reconnect and try again"
          : e.toString() ==
                  "TimeoutException after 0:00:40.000000: Future not completed"
              ? "Your internet is not stable kindly reconnect and try again"
              : e.toString());
    }
  }

  createNewBorn(Map<dynamic, dynamic> payload) async {
    try {
      final result = await http.post(Paths.newborns, payload);
      if (result is ErrorModel) {
        return ErrorModel(result.error);
      }
      showToast("Newborn successfully added");

      return SuccessModel(result.data);
    } catch (e) {
      return ErrorModel(e.toString() ==
              "SocketException: Failed host lookup: '$baseUrlError' (OS Error: nodename nor servname provided, or not known, errno = 8)"
          ? "Your internet is not stable kindly reconnect and try again"
          : e.toString() ==
                  "TimeoutException after 0:00:40.000000: Future not completed"
              ? "Your internet is not stable kindly reconnect and try again"
              : e.toString());
    }
  }

  getNewBorn() async {
    try {
      dynamic result;
      result = await http.get(
        Paths.newborns,
      );

      if (result is ErrorModel) {
        print("ERROR");
        var data = [];
        List<NewBornList> packageList = List<NewBornList>.from(
            data.map((item) => NewBornList.fromJson(item)));
        return packageList;
      }
      var data = result.data["data"];
      List<NewBornList> packageList = List<NewBornList>.from(
          data.map((item) => NewBornList.fromJson(item)));
      return packageList;
    } catch (e) {
      print(e.toString());
      return ErrorModel(e.toString() ==
              "SocketException: Failed host lookup: '$baseUrlError' (OS Error: nodename nor servname provided, or not known, errno = 8)"
          ? "Your internet is not stable kindly reconnect and try again"
          : e.toString() ==
                  "TimeoutException after 0:00:40.000000: Future not completed"
              ? "Your internet is not stable kindly reconnect and try again"
              : e.toString());
    }
  }
}


