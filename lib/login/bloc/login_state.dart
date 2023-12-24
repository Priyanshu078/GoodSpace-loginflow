import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final String phoneNumber;
  final String countryCode;
  final List<bool> otpFilledArray;
  @override
  List<Object?> get props => [phoneNumber, countryCode, otpFilledArray];
  const LoginState(
      {required this.phoneNumber,
      required this.countryCode,
      required this.otpFilledArray});
}

class LoginInitalState extends LoginState {
  const LoginInitalState(
      {required super.phoneNumber,
      required super.countryCode,
      required super.otpFilledArray});
}

class WrongNumberState extends LoginState {
  const WrongNumberState(
      {required super.phoneNumber,
      required super.countryCode,
      required super.otpFilledArray});
}

class RequestOtpState extends LoginState {
  const RequestOtpState(
      {required super.phoneNumber,
      required super.countryCode,
      required super.otpFilledArray});
}

class ErrorState extends LoginState {
  const ErrorState(
      {required super.phoneNumber,
      required super.countryCode,
      required super.otpFilledArray});
}

class OtpSentState extends LoginState {
  const OtpSentState(
      {required super.phoneNumber,
      required super.countryCode,
      required super.otpFilledArray});
}

class OtpFillState extends LoginState {
  const OtpFillState(
      {required super.phoneNumber,
      required super.countryCode,
      required super.otpFilledArray});
}

class VerifyingOtpState extends LoginState {
  const VerifyingOtpState(
      {required super.phoneNumber,
      required super.countryCode,
      required super.otpFilledArray});
}

class OtpVerifiedState extends LoginState {
  const OtpVerifiedState(
      {required super.phoneNumber,
      required super.countryCode,
      required super.otpFilledArray});
}
