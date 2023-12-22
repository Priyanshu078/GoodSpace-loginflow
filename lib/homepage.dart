import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goodspacelogin/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  final List<Widget> carouselItems = [
    RichText(
      text: TextSpan(
          text: "FIND ",
          children: [
            TextSpan(
                text: "WORK ",
                style: GoogleFonts.poppins(
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                    color: themeColor),
                children: [
                  TextSpan(
                    text: "OPPORTUNITIES",
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: onboardingTextColor),
                  )
                ])
          ],
          style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: onboardingTextColor)),
    ),
    RichText(
      text: TextSpan(
          text: "DISCOVER \n",
          children: [
            TextSpan(
                text: "DREAM ",
                style: GoogleFonts.poppins(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    color: themeColor),
                children: [
                  TextSpan(
                    text: "DIVE IN",
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: onboardingTextColor),
                  )
                ])
          ],
          style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: onboardingTextColor)),
    ),
    RichText(
      text: TextSpan(
          text: "EXPLORE MORE \n",
          children: [
            TextSpan(
                text: "SETTLE ",
                style: GoogleFonts.poppins(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    color: themeColor),
                children: [
                  TextSpan(
                    text: "FOR MORE",
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: onboardingTextColor),
                  )
                ])
          ],
          style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: onboardingTextColor)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                CarouselSlider(
                    items: carouselItems,
                    options: CarouselOptions(
                      height: 400,
                      aspectRatio: 16 / 9,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: false,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 200),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      onPageChanged: (val, _) {},
                      scrollDirection: Axis.horizontal,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
