import 'package:flutter/foundation.dart';
import 'package:goodspacelogin/login/bloc/login_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goodspacelogin/login/bloc/login_state.dart';
import 'package:goodspacelogin/networking/otplogin.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc()
      : super(const LoginInitalState(
            phoneNumber: "",
            countryCode: "",
            otpFilledArray: [false, false, false, false])) {
    on<SendOtpEvent>((event, emit) => sendOtp(event, emit));
    on<FillOtpEvent>((event, emit) => fillOtp(event, emit));
    on<VerifyOtpEvent>((event, emit) => verifyOtp(event, emit));
  }
  final OtpLogin _otpLogin = OtpLogin();

  void fillOtp(FillOtpEvent event, Emitter emit) {
    List<bool> otpFilledArray = List.from(state.otpFilledArray);
    otpFilledArray[event.index] = event.filled;
    print(event.index);
    emit(OtpFillState(
        phoneNumber: state.phoneNumber,
        countryCode: state.countryCode,
        otpFilledArray: otpFilledArray));
  }

  Future<void> verifyOtp(VerifyOtpEvent event, Emitter emit) async {
    emit(VerifyingOtpState(
      phoneNumber: state.phoneNumber,
      countryCode: state.countryCode,
      otpFilledArray: state.otpFilledArray,
    ));
    String number = event.number;
    String otp = event.otp;
    List<bool> otpArray = state.otpFilledArray;
    if (otpArray.contains(false)) {
      emit(ErrorState(
        phoneNumber: state.phoneNumber,
        countryCode: state.countryCode,
        otpFilledArray: state.otpFilledArray,
      ));
    } else {
      try {
        await _otpLogin.verifyOtp(number, otp);
        emit(OtpVerifiedState(
          phoneNumber: state.phoneNumber,
          countryCode: state.countryCode,
          otpFilledArray: state.otpFilledArray,
        ));
      } catch (e) {
        print(e);
        emit(ErrorState(
          phoneNumber: state.phoneNumber,
          countryCode: state.countryCode,
          otpFilledArray: state.otpFilledArray,
        ));
      }
    }
  }

  Future<void> sendOtp(SendOtpEvent event, Emitter emit) async {
    emit(RequestOtpState(
        phoneNumber: event.number,
        countryCode: event.countryCode,
        otpFilledArray: state.otpFilledArray));
    String number = event.number;
    String countryCode = event.countryCode;
    if (number.length == 10) {
      try {
        await _otpLogin.sendOtpOnPhoneNumber(number, countryCode);
        emit(OtpSentState(
            phoneNumber: event.number,
            countryCode: event.countryCode,
            otpFilledArray: state.otpFilledArray));
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        emit(ErrorState(
            phoneNumber: event.number,
            countryCode: event.countryCode,
            otpFilledArray: state.otpFilledArray));
      }
    } else {
      emit(WrongNumberState(
          phoneNumber: event.number,
          countryCode: event.countryCode,
          otpFilledArray: state.otpFilledArray));
    }
  }
}
