import 'package:flutter/material.dart';
import 'package:handova/core/enums/viewstate.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    FocusManager.instance.primaryFocus?.unfocus();
    _state = viewState;
    notifyListeners();
  }

  void showErrorMessage(
      {required BuildContext context, required String errorMessage}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Container(
        padding: const EdgeInsets.all(16),
        height: 90,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.error,
              color: Colors.white,
              size: 50,
            ),
            const SizedBox(
              width: 18,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Oh snap!',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    errorMessage,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ));
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     backgroundColor: Colors.black,
    //     content: Text(
    //       message,
    //       textAlign: TextAlign.center,
    //       style: TextStyle(
    //         color: type ? Colors.red : Colors.green,
    //         fontWeight: FontWeight.w300,
    //         fontSize: 16,
    //       ),
    //     ),
    //     duration: const Duration(
    //       seconds: 2,
    //     ),
    //   ),
    // );
  }
}
