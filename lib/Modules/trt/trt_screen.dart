import 'package:conqur/Modules/trt/bloc/trt_bloc.dart';
import 'package:conqur/Modules/trt/pages/trt_profile_page.dart';
import 'package:conqur/Modules/trt/pages/trt_start_test_page.dart';
import 'package:conqur/Modules/trt/pages/trt_update_firmware.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class TRTScreen extends StatefulWidget {
  @override
  State<TRTScreen> createState() => _TRTScreenState();
}

class _TRTScreenState extends State<TRTScreen> {
  var currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: BlocBuilder<TRTBloc, TRTState>(
          bloc: TRTBloc.instance,
          builder: (context, state) {
            if (state is TRTInitialState) {
              return TRTStartTestPage();
            } else if (state is TRTLoadingState) {
              return TRTStartTestPage();
            } else if (state is TRTProfileState) {
              return TRTProfilePage();
            } else if (state is TRTEditProfileState) {
              return TRTProfilePage();
            } else if (state is TRTSaveProfileEvent) {
              return TRTProfilePage();
            } else if (state is TRTUpdateFirmwareEvent) {
              return (TRTUpdateFirmware());
            } else
              return Container();
          }),
    );
  }
}
