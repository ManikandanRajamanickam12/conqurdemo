part of 'auth_bloc.dart';

enum FieldError { Empty, Invalid }

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitialState extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoadingState extends AuthState {
  final String msg;
  AuthLoadingState({required this.msg});
  @override
  List<Object> get props => [msg];
}

class AuthErrorState extends AuthState {
  final String msg;
  AuthErrorState({required this.msg});
  @override
  List<Object> get props => [msg];
}

class AuthPhoneNumberState extends AuthState {
  final FieldError? emailError;
  String? number;
  AuthPhoneNumberState({this.emailError, this.number});
  @override
  List<Object> get props => [];
}

class AuthSignUpState extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthEnterOtpState extends AuthState {
  final String mobile;
  AuthEnterOtpState({required this.mobile});
  @override
  List<Object> get props => [];
}

class AuthTermsState extends AuthState {
  final String msg;
  AuthTermsState({required this.msg});
  @override
  List<Object> get props => [];
}

class AuthUserDetailsState extends AuthState {
  final String msg;
  AuthUserDetailsState({required this.msg});
  @override
  List<Object> get props => [];
}

class AuthBodyMetricsState extends AuthState {
  final String msg;
  AuthBodyMetricsState({required this.msg});
  @override
  List<Object> get props => [];
}

class AuthBodyMetricsInputState extends AuthState {
  final String msg;
  AuthBodyMetricsInputState({required this.msg});
  @override
  List<Object> get props => [];
}

class AuthSurveyState extends AuthState {
  final int index;
  AuthSurveyState({required this.index});
  @override
  List<Object> get props => [];
}

class AuthGetStartedState extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthDashboardState extends AuthState {
  @override
  List<Object> get props => [];
}
