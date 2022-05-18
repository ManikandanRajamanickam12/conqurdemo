import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> with ValidationMixin {
  static final _client = AuthBloc._internal();

  AuthBloc._internal() : super(AuthInitialState()) {
    on<AuthInitialEvent>((event, emit) async {
      emit(AuthLoadingState(msg: "Loading"));
      await Future.delayed(Duration(seconds: 2), () {});

      ///Todo: this is used for testing
      emit(AuthGetStartedState());
      // emit(AuthPhoneNumberState());
    });

    on<AuthSignUpEvent>((event, emit) async {
      emit(AuthLoadingState(msg: "Loading"));
      await Future.delayed(Duration(seconds: 2), () {});
      emit(AuthSignUpState());
    });

    on<AuthValidateMobileNumberEvent>((event, emit) async {
      emit(AuthLoadingState(msg: "Loading"));
      await Future.delayed(Duration(seconds: 2), () {});
      if (this.isFieldEmpty(event.number)) {
        emit(AuthPhoneNumberState(
            emailError: FieldError.Empty, number: event.number));
      } else {
        if (!this.validateMobileNumber(event.number)) {
          emit(AuthPhoneNumberState(
              emailError: FieldError.Invalid, number: event.number));
        } else {
          emit(AuthEnterOtpState(mobile: event.number));
        }
      }
    });

    on<AuthValidateOtpEvent>((event, emit) async {
      emit(AuthLoadingState(msg: "Loading"));
      await Future.delayed(Duration(seconds: 2), () {});
      emit(AuthTermsState(msg: "Success"));
      // emit(AuthEnterOtpState());
    });

    on<AuthTermsEvent>((event, emit) async {
      emit(AuthLoadingState(msg: "Loading"));
      await Future.delayed(Duration(seconds: 2), () {});
      emit(AuthUserDetailsState(msg: "Success"));
    });

    on<AuthValidateUserDetailsEvent>((event, emit) async {
      emit(AuthLoadingState(msg: "Loading"));
      await Future.delayed(Duration(seconds: 2), () {});
      emit(AuthBodyMetricsState(msg: "Success"));
    });

    on<AuthBodyMetricsInputEvent>((event, emit) async {
      emit(AuthLoadingState(msg: "Loading"));
      await Future.delayed(Duration(seconds: 2), () {});
      emit(AuthBodyMetricsInputState(msg: "Success"));
    });

    on<AuthSurveyQuestionEvent>((event, emit) async {
      emit(AuthLoadingState(msg: "Loading"));
      await Future.delayed(Duration(seconds: 2), () {});
      emit(AuthSurveyState(index: event.selectedIndex));
    });

    on<AuthSurveyEvent>((event, emit) async {
      emit(AuthLoadingState(msg: "Loading"));
      await Future.delayed(Duration(seconds: 2), () {});
      emit(AuthGetStartedState());
    });

    on<AuthGetStartedEvent>((event, emit) async {
      emit(AuthLoadingState(msg: "Loading"));
      await Future.delayed(Duration(seconds: 2), () {});
      emit(AuthDashboardState());
    });
  }

  factory AuthBloc() {
    return _client;
  }

  static AuthBloc get instance => _client;
}

mixin ValidationMixin {
  bool isFieldEmpty(String fieldValue) => fieldValue.isEmpty;

  bool validateEmailAddress(String email) {
    if (email == null) {
      return false;
    }
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  bool validateMobileNumber(String? mobile) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);
    if (mobile == null) {
      return false;
    } else if (regExp.hasMatch(mobile)) {
      return true;
    }
    return false;
  }
}

enum AuthError { login, otp, userTerms }
