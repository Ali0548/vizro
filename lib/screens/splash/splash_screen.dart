import 'dart:async';

import 'package:admin/utils/app_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth/login_screen.dart';
import '../main/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  // late StreamSubscription<ConnectivityResult> _onConnectivityChanged;
  void _route() async{
    Timer(const Duration(seconds: 3), () {

      Get.off(SignInScreen());
    });
  }
  @override
  void initState(){
    _route();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body:SafeArea(
        key: _globalKey,
        child: Center(
          child: CircleAvatar(
            radius: 100,
              child: Image.asset("assets/images/splash_logo.jpeg")),
        ),
      ) ,
    );
  }
}