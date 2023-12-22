import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goodspacelogin/constants/colors.dart';
import 'package:goodspacelogin/widgets/mybutton.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textEditingController = TextEditingController();

  List<Widget> getCarouselItems(double height, double width) {
    return [
      SizedBox(
        height: height * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
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
            Image.asset(
              "assets/images/image1.png",
              height: height * 0.3,
            ),
          ],
        ),
      ),
      SizedBox(
        height: height * 0.5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
            Image.asset(
              "assets/images/image2.png",
              height: height * 0.25,
              width: width,
            ),
          ],
        ),
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
          Image.asset(
            "assets/images/image3.png",
            height: height * 0.25,
            width: width,
          ),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: SizedBox(
                height: height * 0.91,
                width: width,
                child: Column(
                  children: <Widget>[
                    CarouselSlider(
                        items: getCarouselItems(height, width),
                        options: CarouselOptions(
                          height: height * 0.43,
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
                        )),
                    Expanded(
                      child: Container(),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              text:
                                  "Please enter your phone number to sign in \n",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: onboardingTextColor,
                              ),
                              children: [
                                TextSpan(
                                    text: "GoodSpace ",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: themeColor,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: "account",
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: onboardingTextColor,
                                          ))
                                    ])
                              ]),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Container(
                          height: height * 0.07,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: textFieldBackground,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: borderColor, width: 1)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/flag.png"),
                              SizedBox(
                                width: width * 0.03,
                              ),
                              VerticalDivider(
                                width: 1,
                                color: borderColor,
                              ),
                              SizedBox(
                                width: width * 0.03,
                              ),
                              SizedBox(
                                  width: width * 0.7,
                                  child: TextField(
                                    controller: _textEditingController,
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal),
                                    decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.only(bottom: 12),
                                        hintText: "Please enter mobile no.",
                                        hintStyle: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                            color: secondaryOnbardingColor),
                                        border: InputBorder.none),
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        RichText(
                            text: TextSpan(
                                text: "You will receive a ",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: secondaryOnbardingColor,
                                ),
                                children: [
                              TextSpan(
                                  text: "4 digit OTP",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: themeColor,
                                  ))
                            ])),
                        SizedBox(
                          height: height * 0.06,
                        ),
                        MyButton(
                            text: "Get OTP",
                            onPressed: () {},
                            height: height,
                            width: width),
                        SizedBox(
                          height: height * 0.02,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
