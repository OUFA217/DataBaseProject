// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:studentsystem/General%20Components/Components.dart';
import 'package:studentsystem/Presentation/Sign%20In/SignIn.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Future init(context) async {
    Future.delayed(const Duration(seconds: 4)).then((value) {
      NavigateAndRemov(context, SignIn());
    });
  }

  @override
  Widget build(BuildContext context) {
    init(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: height,
              width: width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      alignment: Alignment.topCenter,
                      image:
                          AssetImage("assets/img/Nile_University_logo.png"))),
            ),
          ],
        ),
      ),
    );
  }
}
