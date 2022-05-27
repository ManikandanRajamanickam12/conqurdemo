part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class AuthInitialEvent extends AuthEvent {
  final String msg;
  const AuthInitialEvent({required this.msg});

  @override
  List<Object?> get props => [msg];
}

class AuthSignUpEvent extends AuthEvent {
  final String msg;
  const AuthSignUpEvent({required this.msg});

  @override
  List<Object?> get props => [msg];
}

class AuthErrorEvent extends AuthEvent {
  final String msg;
  const AuthErrorEvent({required this.msg});

  @override
  List<Object?> get props => [msg];
}

class AuthValidateMobileNumberEvent extends AuthEvent {
  final String number;
  const AuthValidateMobileNumberEvent({required this.number});

  @override
  List<Object?> get props => [number];
}

class AuthValidateOtpEvent extends AuthEvent {
  final String msg;
  const AuthValidateOtpEvent({required this.msg});

  @override
  List<Object?> get props => [msg];
}

class AuthTermsEvent extends AuthEvent {
  final String msg;
  const AuthTermsEvent({required this.msg});

  @override
  List<Object?> get props => [msg];
}

class AuthValidateUserDetailsEvent extends AuthEvent {
  final String msg;
  const AuthValidateUserDetailsEvent({required this.msg});

  @override
  List<Object?> get props => [msg];
}

class AuthBodyMetricsInputEvent extends AuthEvent {
  final String msg;
  const AuthBodyMetricsInputEvent({required this.msg});

  @override
  List<Object?> get props => [msg];
}

class AuthSurveyQuestionEvent extends AuthEvent {
  final int selectedIndex;
  final String msg;
  const AuthSurveyQuestionEvent(
      {required this.msg, required this.selectedIndex});

  @override
  List<Object?> get props => [msg];
}

class AuthSurveyEvent extends AuthEvent {
  final String msg;
  const AuthSurveyEvent({required this.msg});

  @override
  List<Object?> get props => [msg];
}

class AuthGetStartedEvent extends AuthEvent {
  final String msg;
  const AuthGetStartedEvent({required this.msg});

  @override
  List<Object?> get props => [msg];
}
