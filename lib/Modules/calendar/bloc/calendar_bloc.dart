import 'package:bloc/bloc.dart';
import 'package:conqur/Modules/calendar/pages/calendar_list_page.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  static final _client = CalendarBloc._internal();
  CalendarBloc._internal()
      : super(CalendarListState(type: ReportViewType.calendar)) {
    // on<CalendarInitialEvent>((event, emit) async {
    //   emit(CalendarLoadingState(msg: ""));
    //   await Future.delayed(Duration(seconds: 1), () {});
    //   emit(CalendarInitialState());
    // });

    on<CalendarListEvent>((event, emit) async {
      emit(CalendarListState(type: event.type));
    });
  }

  factory CalendarBloc() {
    return _client;
  }

  static CalendarBloc get instance => _client;
}
