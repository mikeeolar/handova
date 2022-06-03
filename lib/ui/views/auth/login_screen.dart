import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handova/app/locator.dart';
import 'package:handova/core/enums/viewstate.dart';
import 'package:handova/core/services/navigation_service.dart';
import 'package:handova/core/view_models/auth_view_model.dart';
import 'package:handova/ui/views/base_view/base_view.dart';
import 'package:handova/ui/views/widgets/password_field.dart';
import 'package:handova/ui/views/widgets/phone_textfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController phoneCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();

  final NavigationService navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthViewModel>(
      builder: ((context, model, child) {
        return Builder(
          builder: ((context) {
            return Scaffold(
              body: WillPopScope(
                onWillPop: () async {
                  return false;
                },
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {
                              if (Platform.isAndroid) {
                                SystemNavigator.pop();
                              } else if (Platform.isIOS) {
                                // exit(0);
                              }
                            },
                            icon: const Icon(
                              Icons.close,
                              size: 30,
                            ),
                          ),
                          const SizedBox(height: 100),
                          const Text(
                            'Enter Phone number',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Login with your registered phone number',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              Container(
                                width: 100,
                                height: 50,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 17),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 1, color: Colors.blue)),
                                child: const Text(
                                  'NG (234)',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: PhoneTextField(
                                  controller: phoneCtrl,
                                  hintText: 'Phone Number',
                                  isLastField: false,
                                  inputType: TextInputType.phone,
                                  errorText: model.phoneNo.error,
                                  onChanged: (String value) =>
                                      model.phoneNoChanged(value),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          PasswordTextField(
                            controller: passwordCtrl,
                            hintText: 'Enter Password',
                            isLastField: true,
                            errorText: model.password.error,
                            onChanged: (String value) =>
                                model.passwordChanged(value),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: model.state == ViewState.busy
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : ElevatedButton(
                                    onPressed: !model.formValid
                                        ? null
                                        : () {
                                            model.login(
                                              phone: phoneCtrl.text,
                                              password: passwordCtrl.text,
                                              context: context,
                                            );
                                          },
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      primary: Colors.blue,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: const Text(
                                      'Login',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                          ),
                          const SizedBox(height: 30),
                          const Center(
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Container(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () async {
                                // await model.biometricLogin(context: context);
                              },
                              child: const Icon(
                                Icons.fingerprint,
                                color: Colors.blue,
                                size: 50,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        );
      }),
    );
  }
}
