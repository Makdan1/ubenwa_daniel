
import 'package:ubenwa_daniel/core/model/RegisterModel.dart';
import 'package:ubenwa_daniel/core/model/error_model.dart';
import 'package:ubenwa_daniel/core/model/success_model.dart';
import 'package:ubenwa_daniel/core/services/auth_service.dart';
import 'package:ubenwa_daniel/utils/base_model.dart';
import 'package:ubenwa_daniel/utils/helpers.dart';
import 'package:ubenwa_daniel/utils/locator.dart';
import 'package:ubenwa_daniel/utils/router/navigation_service.dart';
import 'package:ubenwa_daniel/utils/router/route_names.dart';

class RegisterViewModel extends BaseModel {
  final Authentication _authentication = locator<Authentication>();
  final NavigationService _navigationService = locator<NavigationService>();
  signUp(RegisterModel signUpModel) async {
    setBusy(true);
    var result = await _authentication.signUp(signUpModel.toJson());

    if (result is ErrorModel) {
      setBusy(false);
      showErrorToast(result.error);
      notifyListeners();
      return ErrorModel(result.error);
    }
    if (result is SuccessModel) {
      setBusy(false);
      _navigationService.navigateReplacementTo(loginRoute,);
      notifyListeners();
      return SuccessModel(result.data);
    }
  }

}
