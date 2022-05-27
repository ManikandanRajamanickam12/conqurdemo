part of 'report_bloc.dart';

abstract class ReportState extends Equatable {
  const ReportState();
}

class ReportInitialState extends ReportState {
  @override
  List<Object> get props => [];
}

class ReportLoadingState extends ReportState {
  final String msg;
  ReportLoadingState({required this.msg});
  @override
  List<Object> get props => [msg];
}

class ReportListState extends ReportState {
  final String msg;
  ReportListState({required this.msg});
  @override
  List<Object> get props => [msg];
}
