part of 'calendar_bloc.dart';

@immutable
abstract class CalendarEvent extends Equatable {
  const CalendarEvent();
}

class CalendarInitialEvent extends CalendarEvent {
  final String msg;
  const CalendarInitialEvent({required this.msg});

  @override
  List<Object?> get props => [msg];
}

class CalendarListEvent extends CalendarEvent {
  final ReportViewType type;
  const CalendarListEvent({required this.type});

  @override
  List<Object?> get props => [type];
}
