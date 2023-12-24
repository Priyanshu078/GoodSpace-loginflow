import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goodspacelogin/constants/colors.dart';
import 'package:goodspacelogin/login/bloc/login_bloc.dart';
import 'package:goodspacelogin/login/bloc/login_event.dart';
import 'package:goodspacelogin/login/bloc/login_state.dart';
import 'package:goodspacelogin/login/verifyotp_page.dart';
import 'package:goodspacelogin/widgets/mybutton.dart';
import 'package:goodspacelogin/widgets/mytext.dart';
import 'package:goodspacelogin/widgets/textfield_container.dart';
import 'package:google_fonts/google_fonts.dart';

class GetOtpPage extends StatefulWidget {
  const GetOtpPage({super.key});

  @override
  State<GetOtpPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<GetOtpPage> {
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
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
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
                        BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                            return TextfieldContainer(
                              height: height,
                              width: width,
                              borderColor: state is WrongNumberState
                                  ? wrongNumberColor
                                  : borderColor,
                              dividerColor: state is WrongNumberState
                                  ? wrongNumberColor
                                  : borderColor,
                              textEditingController: _textEditingController,
                              textColor: state is WrongNumberState
                                  ? wrongNumberColor
                                  : Colors.black,
                            );
                          },
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                            return state is WrongNumberState
                                ? MyText(
                                    text: "Enter Correct Phone Number",
                                    fontSize: 12,
                                    color: wrongNumberColor,
                                    fontWeight: FontWeight.normal,
                                  )
                                : RichText(
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
                                      ]));
                          },
                        ),
                        SizedBox(
                          height: height * 0.06,
                        ),
                        BlocConsumer<LoginBloc, LoginState>(
                          listener: (context, state) {
                            if (state is OtpSentState) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const VerifyOtpPage()));
                            }
                          },
                          builder: (context, state) {
                            return state is RequestOtpState
                                ? const Align(
                                    alignment: Alignment.center,
                                    child: CircularProgressIndicator(
                                      color: Colors.black,
                                      strokeWidth: 1,
                                    ),
                                  )
                                : MyButton(
                                    text: "Get OTP",
                                    onPressed: () {
                                      String number = _textEditingController
                                          .text
                                          .toString();
                                      String countryCode = "+91";
                                      context
                                          .read<LoginBloc>()
                                          .add(SendOtpEvent(
                                            number: number,
                                            countryCode: countryCode,
                                          ));
                                    },
                                    height: height,
                                    width: width);
                          },
                        ),
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
