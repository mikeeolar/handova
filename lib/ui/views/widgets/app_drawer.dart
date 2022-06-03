// ignore_for_file: avoid_unnecessary_containers
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:handova/app/locator.dart';
import 'package:handova/app/routes.dart';
import 'package:handova/core/services/navigation_service.dart';
import 'package:handova/core/services/sesson_service.dart';
import 'package:handova/core/view_models/auth_view_model.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({
    Key? key,
  }) : super(key: key);

  final NavigationService navigationService = locator<NavigationService>();
  final AuthViewModel model = locator<AuthViewModel>();

  @override
  Widget build(BuildContext context) {
    final user = json.decode(SessionService.getUserDetails());
    final name =
        '${user['data']['user']['first_name']} ${user['data']['user']['last_name']}';
    return Drawer(
      child: Container(
        child: ListView(
          children: [
            buildHeader(name),
            const Divider(),
            buildMenuItem(
              text: 'Orders History',
              icon: Image.asset(
                'assets/images/orders.png',
              ),
              onTap: () {
                navigationService.navigatorKey.currentState!
                    .popAndPushNamed(Routes.ordersSreen);
              },
            ),
            buildMenuItem(
              text: 'Account Settings',
              icon: Image.asset(
                'assets/images/account.png',
                colorBlendMode: BlendMode.luminosity,
              ),
              onTap: () {},
            ),
            buildMenuItem(
              text: 'Inbox',
              icon: Image.asset(
                'assets/images/inbox.png',
              ),
              onTap: () {},
            ),
            buildMenuItem(
              text: 'Wallets',
              icon: Image.asset(
                'assets/images/wallet.png',
                colorBlendMode: BlendMode.luminosity,
              ),
              onTap: () {},
            ),
            buildMenuItem(
              text: 'Referrals',
              icon: Image.asset(
                'assets/images/referrals.png',
                colorBlendMode: BlendMode.luminosity,
              ),
              onTap: () {},
            ),
            buildMenuItem(
              text: 'Support',
              icon: Image.asset(
                'assets/images/support.png',
                colorBlendMode: BlendMode.luminosity,
              ),
              onTap: () {},
            ),
            const SizedBox(height: 100),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      model.logout();
                      navigationService.navigatorKey.currentState!
                          .pushReplacementNamed(Routes.loginScreen);
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFFD03535)),
                    ),
                  ),
                  Image.asset('assets/images/sos.png')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(
      {required String text,
      required Widget icon,
      required Function()? onTap}) {
    return ListTile(
      leading: icon,
      title: Text(text),
      onTap: onTap,
    );
  }

  Widget buildHeader(String name) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 25,
        horizontal: 20,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(
                'RIDER ID: 205777',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const Expanded(
            child: SizedBox(
              child: CircleAvatar(
                maxRadius: 45,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  color: Colors.blue,
                  size: 60,
                ),
              ),
            ),
          ),
          const Divider()
        ],
      ),
    );
  }
}
