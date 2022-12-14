import 'package:flutter/widgets.dart';
import 'package:ubenwa_daniel/utils/locator.dart';
import 'package:ubenwa_daniel/utils/progressBarManager/dialog_models.dart';
import 'package:ubenwa_daniel/utils/progressBarManager/dialog_service.dart';

class BaseModel extends ChangeNotifier {
  //final Authentication _authenticationService = locator<Authentication>();
  final ProgressService _dialogService = locator<ProgressService>();
  late ProgressResponse hh;
 // Data get currentUser => _authenticationService.currentUser;

  bool _busy = false;
  bool get busy => _busy;




  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
    if(value == true){
      _dialogService.showDialog(description: '', title: '');
    }else
    {
      _dialogService.dialogComplete();
    }


  }

}
