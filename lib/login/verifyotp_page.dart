import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goodspacelogin/constants/colors.dart';
import 'package:goodspacelogin/homepage.dart';
import 'package:goodspacelogin/login/bloc/login_bloc.dart';
import 'package:goodspacelogin/login/bloc/login_event.dart';
import 'package:goodspacelogin/login/bloc/login_state.dart';
import 'package:goodspacelogin/widgets/mybutton.dart';
import 'package:goodspacelogin/widgets/mytext.dart';
import 'package:goodspacelogin/widgets/otp_container.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifyOtpPage extends StatefulWidget {
  const VerifyOtpPage({super.key});

  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  final TextEditingController _textEditingController1 = TextEditingController();
  final TextEditingController _textEditingController2 = TextEditingController();
  final TextEditingController _textEditingController3 = TextEditingController();
  final TextEditingController _textEditingController4 = TextEditingController();
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();
  final FocusNode focusNode4 = FocusNode();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: Colors.white),
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: SingleChildScrollView(
              child: SizedBox(
                height: height * 0.86,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/images/back.png'),
                        Row(
                          children: [
                            MyText(
                              text: "Edit Phone Number",
                              fontSize: 14,
                              color: editColor,
                              fontWeight: FontWeight.w300,
                            ),
                            SizedBox(
                              width: width * 0.04,
                            ),
                            Image.asset('assets/images/pencil.png'),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.1,
                    ),
                    BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return RichText(
                            text: TextSpan(
                                text: "OTP sent to ${state.countryCode} ",
                                style: GoogleFonts.poppins(
                                  color: textColor1,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                                children: [
                              TextSpan(
                                  text: "${state.phoneNumber} \n",
                                  style: GoogleFonts.poppins(
                                    color: themeColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Enter OTP to confirm your phone",
                                      style: GoogleFonts.poppins(
                                        color: textColor1,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ])
                            ]));
                      },
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    MyText(
                      text: "You’ll receive a four digit verification code.",
                      fontSize: 14,
                      color: secondaryOnbardingColor,
                      fontWeight: FontWeight.normal,
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    Row(
                      children: [
                        BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                            return OtpContainer(
                              bordercolor: state is ErrorState
                                  ? wrongNumberColor
                                  : themeColor,
                              height: height * 0.07,
                              width: height * 0.07,
                              textEditingController: _textEditingController1,
                              color: state is ErrorState
                                  ? textFieldBackground
                                  : state.otpFilledArray[0]
                                      ? themeColor
                                      : textFieldBackground,
                              focusNode: focusNode1,
                              onChanged: (val) {
                                if (val.isNotEmpty) {
                                  focusNode2.requestFocus();
                                  context.read<LoginBloc>().add(
                                      const FillOtpEvent(
                                          index: 0, filled: true));
                                } else {
                                  context.read<LoginBloc>().add(
                                      const FillOtpEvent(
                                          index: 0, filled: false));
                                }
                              },
                            );
                          },
                        ),
                        SizedBox(
                          width: width * 0.05,
                        ),
                        BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                            return OtpContainer(
                              height: height * 0.07,
                              width: height * 0.07,
                              textEditingController: _textEditingController2,
                              color: state is ErrorState
                                  ? textFieldBackground
                                  : state.otpFilledArray[1]
                                      ? themeColor
                                      : textFieldBackground,
                              bordercolor: state is ErrorState
                                  ? wrongNumberColor
                                  : themeColor,
                              focusNode: focusNode2,
                              onChanged: (val) {
                                if (val.isNotEmpty) {
                                  focusNode3.requestFocus();
                                  context.read<LoginBloc>().add(
                                      const FillOtpEvent(
                                          index: 1, filled: true));
                                } else {
                                  focusNode1.requestFocus();
                                  context.read<LoginBloc>().add(
                                      const FillOtpEvent(
                                          index: 1, filled: false));
                                }
                              },
                            );
                          },
                        ),
                        SizedBox(
                          width: width * 0.05,
                        ),
                        BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                            return OtpContainer(
                              bordercolor: state is ErrorState
                                  ? wrongNumberColor
                                  : themeColor,
                              height: height * 0.07,
                              width: height * 0.07,
                              textEditingController: _textEditingController3,
                              color: state is ErrorState
                                  ? textFieldBackground
                                  : state.otpFilledArray[2]
                                      ? themeColor
                                      : textFieldBackground,
                              focusNode: focusNode3,
                              onChanged: (val) {
                                if (val.isNotEmpty) {
                                  focusNode4.requestFocus();
                                  context.read<LoginBloc>().add(
                                      const FillOtpEvent(
                                          index: 2, filled: true));
                                } else {
                                  focusNode2.requestFocus();
                                  context.read<LoginBloc>().add(
                                      const FillOtpEvent(
                                          index: 2, filled: false));
                                }
                              },
                            );
                          },
                        ),
                        SizedBox(
                          width: width * 0.05,
                        ),
                        BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                            return OtpContainer(
                              bordercolor: state is ErrorState
                                  ? wrongNumberColor
                                  : themeColor,
                              height: height * 0.07,
                              width: height * 0.07,
                              textEditingController: _textEditingController4,
                              color: state is ErrorState
                                  ? textFieldBackground
                                  : state.otpFilledArray[3]
                                      ? themeColor
                                      : textFieldBackground,
                              focusNode: focusNode4,
                              onChanged: (val) {
                                if (val.isNotEmpty) {
                                  FocusScope.of(context).unfocus();
                                  context.read<LoginBloc>().add(
                                      const FillOtpEvent(
                                          index: 3, filled: true));
                                } else {
                                  focusNode3.requestFocus();
                                  context.read<LoginBloc>().add(
                                      const FillOtpEvent(
                                          index: 3, filled: false));
                                }
                              },
                            );
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: state is ErrorState
                              ? MyText(
                                  text: "Enter Correct OTP",
                                  fontSize: 12,
                                  color: wrongNumberColor,
                                  fontWeight: FontWeight.w400,
                                )
                              : RichText(
                                  text: TextSpan(
                                      text: "Didn't receive OTP? ",
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        color: secondaryOnbardingColor,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "Resend",
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: themeColor,
                                          ),
                                        )
                                      ]),
                                ),
                        );
                      },
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    BlocConsumer<LoginBloc, LoginState>(
                      listener: (context, state) {
                        if (state is OtpVerifiedState) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                              (_) => false);
                        }
                      },
                      builder: (context, state) {
                        return state is VerifyingOtpState
                            ? const Align(
                                alignment: Alignment.center,
                                child: CircularProgressIndicator(
                                  color: Colors.black,
                                  strokeWidth: 1,
                                ),
                              )
                            : MyButton(
                                onPressed: () {
                                  var state = context.read<LoginBloc>().state;
                                  String number = state.phoneNumber;
                                  String otp = _textEditingController1.text +
                                      _textEditingController2.text +
                                      _textEditingController3.text +
                                      _textEditingController4.text;
                                  print(otp);
                                  context.read<LoginBloc>().add(
                                      VerifyOtpEvent(number: number, otp: otp));
                                },
                                height: height,
                                width: width,
                                text: "Verify Phone",
                              );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ))),
    );
  }
}
