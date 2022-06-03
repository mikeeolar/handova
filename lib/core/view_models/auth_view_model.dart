import 'dart:convert';
import 'dart:developer';

import 'package:handova/app/locator.dart';
import 'package:handova/app/routes.dart';
import 'package:handova/core/enums/viewstate.dart';
import 'package:handova/core/models/server_error_model.dart';
import 'package:handova/core/models/state.dart';
import 'package:handova/core/models/user.dart';
import 'package:handova/core/services/authentication_service.dart';
import 'package:handova/core/services/navigation_service.dart';
import 'package:handova/core/services/sesson_service.dart';
import 'package:handova/core/utils/form_validation.dart';
import 'package:handova/core/view_models/base_model/base_model.dart';

class AuthViewModel extends BaseModel {
  final AuthenticationService _authService = locator<AuthenticationService>();
  final NavigationService navigationService = locator<NavigationService>();

  FormValidation _phoneNo = FormValidation();
  FormValidation _email = FormValidation();
  FormValidation _password = FormValidation();

  FormValidation get phoneNo => _phoneNo;
  FormValidation get email => _email;
  FormValidation get password => _password;

  bool get formValid {
    if (_phoneNo.value != null &&
        _phoneNo.value.toString().isNotEmpty &&
        _password.value != null &&
        _password.value.toString().isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void phoneNoChanged(String value) {
    if (value.length == 11) {
      _phoneNo = FormValidation(value: value);
    } else {
      _phoneNo = FormValidation(error: 'Phone number must be 11 digits');
      if (value.isEmpty) {
        _phoneNo = FormValidation(value: value);
      }
    }
    notifyListeners();
  }

  void emailChanged(String value) {
    if (FormValidation.validateEmail(value: value)) {
      _email = FormValidation(value: value);
    } else {
      _email = FormValidation(error: 'Invalid email address');
      if (value.isEmpty) {
        _email = FormValidation(value: value);
      }
    }
    notifyListeners();
  }

  void passwordChanged(String value) {
    if (value.length >= 6) {
      _password = FormValidation(value: value);
    } else {
      _password =
          FormValidation(error: 'Password must be at least 6 characters long');
      if (value.isEmpty) {
        _password = FormValidation(value: value);
      }
    }
    notifyListeners();
  }

  Future<void> login({
    required String phone,
    required String password,
    context,
  }) async {
    setState(ViewState.busy);
    try {
      ServiceState loginResponse = await _authService.loginUser(
        phone: phone,
        password: password,
      );
      setState(ViewState.idle);
      if (loginResponse is SuccessState) {
        User user = loginResponse.value;
        log('${user.message}');
        SessionService.setAuthToken(token: user.data!.token!);
        SessionService.setUserId(id: user.data!.user!.id!);
        SessionService.setUserLoggedIn(isLoggedIn: true);
        SessionService.setUserDetails(userDetails: json.encode(user));
        navigationService.navigateTo(Routes.mapScreen);
      } else if (loginResponse is ErrorState) {
        ServerErrorModel error = loginResponse.value;
        showErrorMessage(context: context, errorMessage: error.data['message']);
        setState(ViewState.idle);
      }
    } catch (error) {
      error.toString();
      setState(ViewState.idle);
    }
  }

  void logout() {
    SessionService.remove(SessionService.authToken);
    SessionService.remove(SessionService.userID);
    SessionService.remove(SessionService.userLoggedIn);
    SessionService.setUserDetails(userDetails: 'null');
    notifyListeners();
  }
}
