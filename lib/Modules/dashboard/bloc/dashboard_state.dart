part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();
}

class DashboardInitialState extends DashboardState {
  @override
  List<Object> get props => [];
}

class DashboardLoadingState extends DashboardState {
  final String msg;
  DashboardLoadingState({required this.msg});
  @override
  List<Object> get props => [msg];
}

class DashboardSerialEntryState extends DashboardState {
  final String msg;
  DashboardSerialEntryState({required this.msg});
  @override
  List<Object> get props => [msg];
}

class DashboardSensorConnectingState extends DashboardState {
  final String msg;
  DashboardSensorConnectingState({required this.msg});
  @override
  List<Object> get props => [msg];
}

class DashboardSensorUnavailableState extends DashboardState {
  final String msg;
  DashboardSensorUnavailableState({required this.msg});
  @override
  List<Object> get props => [msg];
}

class DashboardSensorConnectedState extends DashboardState {
  final String msg;
  DashboardSensorConnectedState({required this.msg});
  @override
  List<Object> get props => [msg];
}

class DashboardQuickActivityState extends DashboardState {
  final String msg;
  DashboardQuickActivityState({required this.msg});
  @override
  List<Object> get props => [msg];
}

class DashboardSelectedActivityState extends DashboardState {
  final ActivityModel activity;
  DashboardSelectedActivityState({required this.activity});
  @override
  List<Object> get props => [activity];
}

class DashboardSearchActivityState extends DashboardState {
  final String msg;
  DashboardSearchActivityState({required this.msg});
  @override
  List<Object> get props => [msg];
}

class DashboardTrainingState extends DashboardState {
  final String msg;
  DashboardTrainingState({required this.msg});
  @override
  List<Object> get props => [msg];
}

class DashboardAddTagState extends DashboardState {
  final String msg;
  DashboardAddTagState({required this.msg});
  @override
  List<Object> get props => [msg];
}

class DashboardStopTrainingState extends DashboardState {
  final String msg;
  DashboardStopTrainingState({required this.msg});
  @override
  List<Object> get props => [msg];
}

class DashboardSyncTrainingState extends DashboardState {
  final String msg;
  DashboardSyncTrainingState({required this.msg});
  @override
  List<Object> get props => [msg];
}
