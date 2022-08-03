import 'package:flutter/material.dart';
import 'package:ubenwa_daniel/utils/busy_dialog.dart';
import 'package:ubenwa_daniel/utils/colors.dart';
import 'package:ubenwa_daniel/utils/locator.dart';
import 'package:ubenwa_daniel/utils/progressBarManager/dialog_models.dart';
import 'package:ubenwa_daniel/utils/progressBarManager/dialog_service.dart';


class ProgressManager extends StatefulWidget {
  final Widget child;
   const ProgressManager( {required this.child});

  _ProgressManagerState createState() => _ProgressManagerState();
}

class _ProgressManagerState extends State<ProgressManager> {
  final ProgressService _progressService = locator<ProgressService>();

  @override
  void initState() {
    super.initState();
    _progressService.registerProgressListener(_showDialog);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
  // Future getFuture() {
  //   return Future(() async {
  //     await Future.delayed(const Duration(seconds: 10));
  //     return 'Hello, Future Progress Dialog!';
  //   });
  // }


  //
   void _showDialog(ProgressRequest request) async{
  //
  //  await showDialog(
  //       context: context,
  //       builder: (context) =>
  //       FutureProgressDialog(getFuture()),
  //   );
    ArsProgressDialog progressDialog = ArsProgressDialog(
        context,
        blur: 2,
        dismissable: false,
       // backgroundColor: const Color(0x33000000),
        animationDuration: const Duration(milliseconds: 500),
        loadingWidget: Material(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/ubenwa.jpeg',
                  width: 60,
                  height: 60,
                ),
                const Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: CircularProgressIndicator(
                    color: AppColors.black,
                    strokeWidth: 2,
                  ),
                ),

              ],
            ),
          ),
        )
    );

    progressDialog.show(); // show dialog
    //progressDialog.dismiss();
    print('show');

  }

}
