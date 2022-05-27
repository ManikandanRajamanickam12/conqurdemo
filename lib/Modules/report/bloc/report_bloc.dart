import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'report_event.dart';
part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  static final _client = ReportBloc._internal();
  ReportBloc._internal() : super(ReportInitialState()) {
    on<ReportInitialEvent>((event, emit) async {
      emit(ReportLoadingState(msg: ""));
      await Future.delayed(Duration(seconds: 1), () {});
      emit(ReportInitialState());
    });

    on<ReportListEvent>((event, emit) async {
      emit(ReportLoadingState(msg: ""));
      await Future.delayed(Duration(seconds: 1), () {});
      emit(ReportListState(msg: ""));
    });
  }

  factory ReportBloc() {
    return _client;
  }

  static ReportBloc get instance => _client;
}
