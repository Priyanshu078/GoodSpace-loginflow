import 'package:equatable/equatable.dart';

class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
  const LoginEvent();
}

class SendOtpEvent extends LoginEvent {
  final String number;
  final String countryCode;
  const SendOtpEvent({required this.number, required this.countryCode});
}

class FillOtpEvent extends LoginEvent {
  final int index;
  final bool filled;
  const FillOtpEvent({required this.index, required this.filled});
  @override
  List<Object?> get props => [index, filled];
}
