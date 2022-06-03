// ignore_for_file: prefer_is_empty

import 'dart:async';
import 'dart:convert';

import 'package:handova/app/locator.dart';
import 'package:handova/core/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:handova/core/services/sesson_service.dart';
import 'package:handova/ui/views/widgets/app_drawer.dart';

class MapScreen extends StatefulWidget {
  MapScreen({Key? key}) : super(key: key);

  final NavigationService navigationService = locator<NavigationService>();

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final NavigationService navigationService = locator<NavigationService>();
  final Completer<GoogleMapController> _controller = Completer();

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  late GoogleMapController mapController;
  late Position currentPosition;
  late CameraPosition cp;

  static CameraPosition get _kGooglePlex {
    return const CameraPosition(target: LatLng(37.4221, -122.0841), zoom: 16);
  }

  void setUpPositionLocator() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    currentPosition = position;

    LatLng pos = LatLng(position.latitude, position.longitude);
    CameraPosition cp = CameraPosition(target: pos, zoom: 16);
    mapController.animateCamera(CameraUpdate.newCameraPosition(cp));
  }

  @override
  Widget build(BuildContext context) {
    final user = json.decode(SessionService.getUserDetails());
    final name =
        '${user['data']['user']['first_name']} ${user['data']['user']['last_name']}';
    return Scaffold(
      key: _key,
      drawer: AppDrawer(),
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Stack(
          children: [
            GoogleMap(
              padding: const EdgeInsets.only(top: 20),
              initialCameraPosition: _kGooglePlex,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
                mapController = controller;
                setUpPositionLocator();
              },
            ),
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Scaffold.of(context).openDrawer();
                        _key.currentState!.openDrawer();
                      },
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.menu,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.notifications_active,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.only(
                  top: 30,
                  bottom: 40,
                  left: 25,
                  right: 25,
                ),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Hi $name',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 21,
                          ),
                        ),
                        const Text(
                          'You are offline',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 120,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: const Color(0xFFD1F3D1),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Go online',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF145B14),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
