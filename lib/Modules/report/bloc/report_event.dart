part of 'report_bloc.dart';

abstract class ReportEvent extends Equatable {
  const ReportEvent();
}

class ReportInitialEvent extends ReportEvent {
  final String msg;
  const ReportInitialEvent({required this.msg});

  @override
  List<Object?> get props => [msg];
}

class ReportListEvent extends ReportEvent {
  final String msg;
  const ReportListEvent({required this.msg});

  @override
  List<Object?> get props => [msg];
}
