
import 'package:ubenwa_daniel/core/model/CreateNewBornModel.dart';
import 'package:ubenwa_daniel/core/model/NewBornList.dart';
import 'package:ubenwa_daniel/core/model/error_model.dart';
import 'package:ubenwa_daniel/core/model/success_model.dart';
import 'package:ubenwa_daniel/core/services/activities_service.dart';

import 'package:ubenwa_daniel/utils/base_model.dart';
import 'package:ubenwa_daniel/utils/helpers.dart';
import 'package:ubenwa_daniel/utils/locator.dart';
import 'package:ubenwa_daniel/utils/router/navigation_service.dart';

class HomeViewModel extends BaseModel {
  final Activities _authentication = locator<Activities>();
  final NavigationService _navigationService = locator<NavigationService>();
  createNewBorn(CreateNewBornModel model) async {
    setBusy(true);
    var result = await _authentication.createNewBorn(model.toJson());

    if (result is ErrorModel) {
      setBusy(false);
      showErrorToast(result.error);
      notifyListeners();
      return ErrorModel(result.error);
    }
    if (result is SuccessModel) {
      setBusy(false);
      notifyListeners();
      return SuccessModel(result.data);
    }
  }

  Future<List<NewBornList>> getNewBorn() async {
    //setBusy(true);
    var result = await _authentication.getNewBorn();
    if (result is ErrorModel) {
      // showToast('Login failed');
      print(result.error);
      notifyListeners();
      throw Exception('Failed to load internet');
      //return ErrorModel(result.error);
    }
    //print(result);
    return result;
  }

}
