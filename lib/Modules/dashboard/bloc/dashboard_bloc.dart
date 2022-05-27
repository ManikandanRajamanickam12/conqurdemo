import 'package:bloc/bloc.dart';
import 'package:conqur/Modules/dashboard/model/activity_model.dart';
import 'package:equatable/equatable.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  static final _client = DashboardBloc._internal();
  DashboardBloc._internal() : super(DashboardInitialState()) {
    on<DashboardInitialEvent>((event, emit) async {
      emit(DashboardLoadingState(msg: ""));
      await Future.delayed(Duration(seconds: 1), () {});
      emit(DashboardInitialState());
    });

    on<DashboardConnectSensorEvent>((event, emit) async {
      emit(DashboardLoadingState(msg: ""));
      await Future.delayed(Duration(seconds: 1), () {});
      emit(DashboardSyncTrainingState(msg: ""));
      // emit(DashboardSerialEntryState(msg: ""));
    });

    on<DashboardSensorSearchEvent>((event, emit) async {
      emit(DashboardLoadingState(msg: ""));
      await Future.delayed(Duration(seconds: 1), () {});
      emit(DashboardSensorConnectingState(msg: ""));
      await Future.delayed(Duration(seconds: 2), () {});
      emit(DashboardSensorConnectedState(msg: ""));
    });

    on<DashboardSensorUnavailableEvent>((event, emit) async {
      emit(DashboardLoadingState(msg: ""));
      await Future.delayed(Duration(seconds: 1), () {});
      emit(DashboardSensorUnavailableState(msg: ""));
    });

    on<DashboardStartTrainingEvent>((event, emit) async {
      emit(DashboardLoadingState(msg: ""));
      await Future.delayed(Duration(seconds: 1), () {});
      emit(DashboardTrainingState(msg: ""));
    });

    on<DashboardAddNewTagEvent>((event, emit) async {
      emit(DashboardLoadingState(msg: ""));
      await Future.delayed(Duration(seconds: 1), () {});
      emit(DashboardAddTagState(msg: ""));
    });

    on<DashboardStopTrainingEvent>((event, emit) async {
      emit(DashboardLoadingState(msg: ""));
      await Future.delayed(Duration(seconds: 1), () {});
      emit(DashboardStopTrainingState(msg: ""));
    });

    on<DashboardSyncTrainingEvent>((event, emit) async {
      emit(DashboardLoadingState(msg: ""));
      await Future.delayed(Duration(seconds: 1), () {});
      emit(DashboardSyncTrainingState(msg: ""));
    });

    // on<DashboardGetSyncReadProgressEvent>((event, emit) async {
    //   emit(DashboardLoadingState(msg: ""));
    //   await Future.delayed(Duration(seconds: 1), () {});
    //   emit(DashboardSyncTrainingState(msg: ""));
    // });
    // on<DashboardSelectedTrainingEvent>((event, emit) async {
    //   emit(DashboardLoadingState(msg: ""));
    //   await Future.delayed(Duration(seconds: 1), () {});
    //   emit(DashboardSelectedActivityState(activity: event.activity));
    // });
    //
    // on<DashboardSearchActivityEvent>((event, emit) async {
    //   emit(DashboardLoadingState(msg: ""));
    //   await Future.delayed(Duration(seconds: 1), () {});
    //   emit(DashboardSearchActivityState(msg: ""));
    // });
    //
    // on<DashboardTrainingEvent>((event, emit) async {
    //   emit(DashboardLoadingState(msg: ""));
    //   await Future.delayed(Duration(seconds: 1), () {});
    //   emit(DashboardTrainingState(msg: ""));
    // });
  }

  factory DashboardBloc() {
    return _client;
  }

  static DashboardBloc get instance => _client;
}
