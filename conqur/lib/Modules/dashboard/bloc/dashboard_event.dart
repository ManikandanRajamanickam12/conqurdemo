part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();
}

class DashboardInitialEvent extends DashboardEvent {
  final String msg;
  const DashboardInitialEvent({required this.msg});

  @override
  List<Object?> get props => [msg];
}

class DashboardConnectSensorEvent extends DashboardEvent {
  final String msg;
  const DashboardConnectSensorEvent({required this.msg});

  @override
  List<Object?> get props => [msg];
}

class DashboardSensorSearchEvent extends DashboardEvent {
  final String msg;
  const DashboardSensorSearchEvent({required this.msg});

  @override
  List<Object?> get props => [msg];
}

class DashboardSensorConnectedEvent extends DashboardEvent {
  final String msg;
  const DashboardSensorConnectedEvent({required this.msg});

  @override
  List<Object?> get props => [msg];
}

class DashboardSensorUnavailableEvent extends DashboardEvent {
  final String msg;
  const DashboardSensorUnavailableEvent({required this.msg});

  @override
  List<Object?> get props => [msg];
}

class DashboardStartTrainingEvent extends DashboardEvent {
  final String msg;
  const DashboardStartTrainingEvent({required this.msg});

  @override
  List<Object?> get props => [msg];
}

class DashboardSelectedTrainingEvent extends DashboardEvent {
  final ActivityModel activity;
  const DashboardSelectedTrainingEvent({required this.activity});

  @override
  List<Object?> get props => [activity];
}

class DashboardSearchActivityEvent extends DashboardEvent {
  final String msg;
  const DashboardSearchActivityEvent({required this.msg});

  @override
  List<Object?> get props => [msg];
}

class DashboardTrainingEvent extends DashboardEvent {
  final String msg;
  const DashboardTrainingEvent({required this.msg});

  @override
  List<Object?> get props => [msg];
}

class DashboardAddNewTagEvent extends DashboardEvent {
  final String msg;
  const DashboardAddNewTagEvent({required this.msg});

  @override
  List<Object?> get props => [msg];
}
