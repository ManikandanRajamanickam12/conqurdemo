part of 'calendar_bloc.dart';

@immutable
abstract class CalendarState {}

class CalendarLoadingState extends CalendarState {
  final String msg;
  CalendarLoadingState({required this.msg});
  @override
  List<Object> get props => [msg];
}

class CalendarListState extends CalendarState {
  final ReportViewType type;
  CalendarListState({required this.type});
  @override
  List<Object> get props => [type];
}

class CalendarDateSelectedState extends CalendarState {
  final ReportViewType type;
  CalendarDateSelectedState({required this.type});
  @override
  List<Object> get props => [type];
}
