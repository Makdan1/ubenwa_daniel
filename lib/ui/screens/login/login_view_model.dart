import 'package:ubenwa_daniel/core/model/LoginPayload.dart';
import 'package:ubenwa_daniel/core/model/error_model.dart';
import 'package:ubenwa_daniel/core/model/success_model.dart';
import 'package:ubenwa_daniel/core/services/activities_service.dart';
import 'package:ubenwa_daniel/utils/base_model.dart';
import 'package:ubenwa_daniel/utils/helpers.dart';
import 'package:ubenwa_daniel/utils/locator.dart';
import 'package:ubenwa_daniel/utils/router/navigation_service.dart';
import 'package:ubenwa_daniel/utils/router/route_names.dart';

class LoginViewModel extends BaseModel {
  final Activities _authentication = locator<Activities>();
  final NavigationService _navigationService = locator<NavigationService>();

  signIn(LoginPayload signInBody) async {
    // print('dhdhd');
    setBusy(true);
    var result = await _authentication.login(signInBody.toJson());

    if (result is ErrorModel) {
      setBusy(false);
      showErrorToast(result.error);
      notifyListeners();
      return ErrorModel(result.error);
    }
    if (result is SuccessModel) {
      setBusy(false);
      _navigationService
          .pushAndRemoveUntil(HomeRoute);
      notifyListeners();
      return SuccessModel(result.data);
    }
  }

}
