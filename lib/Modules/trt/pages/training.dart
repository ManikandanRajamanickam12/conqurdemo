import 'package:conqur/Modules/trt/bloc/trt_bloc.dart';
import 'package:conqur/Modules/trt/pages/trt_help_page.dart';
import 'package:conqur/Modules/trt/pages/trt_ongoing_page.dart';
import 'package:conqur/Modules/trt/pages/trt_profile_page.dart';
import 'package:conqur/Modules/trt/pages/trt_result_page.dart';
import 'package:conqur/Modules/trt/pages/trt_start_test_page.dart';
import 'package:conqur/Modules/trt/pages/trt_update_firmware.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Training extends StatelessWidget {
  const Training({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: BlocBuilder<TRTBloc, TRTState>(
        bloc: TRTBloc.instance,
        builder: (context, state) {
          if (state is TRTInitialState) {
            TRTBloc.instance.add(TRTInitialEvent());
            return Container();
          } else if (state is TRTStartTestState) {
            return TRTStartTestPage();
          } else if (state is TRTOngoingState) {
            return TRTOngoingPage();
          } else if (state is TRTResultState) {
            return TRTResultPage();
          } else if (state is TRTEditProfileState) {
            return TRTProfilePage();
          } else if (state is TRTUpdateFirmwareState) {
            return TRTUpdateFirmware();
          } else if (state is TRTHelpState) {
            return TRTHelpPage();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
