import 'package:conqur/Modules/Registeration/Pages/agree_terms.dart';
import 'package:conqur/Modules/Registeration/Pages/body_metrics.dart';
import 'package:conqur/Modules/Registeration/Pages/body_metrics_input.dart';
import 'package:conqur/Modules/Registeration/Pages/get_started.dart';
import 'package:conqur/Modules/Registeration/Pages/login.dart';
import 'package:conqur/Modules/Registeration/Pages/otp_validate.dart';
import 'package:conqur/Modules/Registeration/Pages/survey_page.dart';
import 'package:conqur/Modules/Registeration/Pages/user_details.dart';
import 'package:conqur/Modules/Registeration/bloc/auth_bloc.dart';
import 'package:conqur/Modules/base/CustomLoader.dart';
import 'package:conqur/Modules/dashboard/pages/dashboard_page.dart';
import 'package:conqur/helpers/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: BlocBuilder<AuthBloc, AuthState>(
        bloc: AuthBloc.instance,
        builder: (context, state) {
          if (state is AuthInitialState) {
            AuthBloc.instance
                .add(const AuthInitialEvent(msg: "Initial values"));
            return Container();
          } else if (state is AuthLoadingState) {
            return CustomLoader();
          } else if (state is AuthPhoneNumberState) {
            Future.delayed(Duration(milliseconds: 30), () {
              if (state.emailError == FieldError.Empty) {
                Common.showInfo(
                    isInfo: false,
                    buildContext: context,
                    msg: "Please enter the mobile number");
              } else if (state.emailError == FieldError.Invalid) {
                Common.showInfo(
                    isInfo: false,
                    buildContext: context,
                    msg: "Please enter a valid mobile number");
              } else {}
            });
            return LoginPage(
              number: state.number,
            );
          } else if (state is AuthErrorState) {
            return Container();
          } else if (state is AuthEnterOtpState) {
            return OtpValidationPage(
              title: "LOGIN",
              mobileNumber: state.mobile,
            );
          } else if (state is AuthTermsState) {
            return AgreeTermsPage();
          } else if (state is AuthUserDetailsState) {
            return UserDetailsPage();
          } else if (state is AuthBodyMetricsState) {
            return BodyMetricsPage();
          } else if (state is AuthBodyMetricsInputState) {
            return BodyMetricsInputPage();
          } else if (state is AuthSurveyState) {
            return SurveyPage(selectedIndex: state.index);
          } else if (state is AuthGetStartedState) {
            return GetStartedPage();
          } else if (state is AuthDashboardState) {
            return DashboardPage();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
