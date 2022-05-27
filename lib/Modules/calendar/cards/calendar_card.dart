import 'dart:collection';

import 'package:conqur/helpers/utils/Theme.dart';
import 'package:conqur/helpers/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarCard extends StatefulWidget {
  @override
  State<CalendarCard> createState() => _CalendarCardState();
}

class _CalendarCardState extends State<CalendarCard> {
  late LinkedHashMap<DateTime, List<AllReportsResponseModel>>
      sessionReportEvents;
  DateTime? _selectedDay;
  DateTime? _focusedDay;
  AllReportsResponseModel? _report;

  @override
  void initState() {
    sessionReportEvents =
        LinkedHashMap<DateTime, List<AllReportsResponseModel>>(
            equals: isSameDay, hashCode: getHashCode);
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();

    super.initState();
  }

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Neumorphic(
        style: NeumorphicStyle(depth: 5, intensity: 1),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: TableCalendar<AllReportsResponseModel>(
            startingDayOfWeek: StartingDayOfWeek.monday,
            focusedDay: _focusedDay!,
            firstDay: DateTime(2020, 9, 1),
            lastDay: DateTime.now(),
            calendarBuilders: CalendarBuilders(),
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            calendarStyle: CalendarStyle(
              markerDecoration: BoxDecoration(
                  color: NeumorphicTheme.accentColor(context),
                  shape: BoxShape.circle),
              selectedTextStyle: kLTwoTextStyle(Colors.black),
              weekendTextStyle: kLTwoTextStyle(Colors.black),
              disabledTextStyle: kLTwoTextStyle(Colors.black),
              selectedDecoration: BoxDecoration(
                  color: NeumorphicTheme.accentColor(context).withOpacity(0.2),
                  shape: BoxShape.circle),
              todayDecoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  shape: BoxShape.circle),
              todayTextStyle: kLTwoTextStyle(Colors.black),
              outsideDaysVisible: false,
              defaultTextStyle: kLTwoTextStyle(Colors.black),
              rowDecoration: BoxDecoration(color: Colors.white),
            ),
            headerStyle: HeaderStyle(
              headerPadding: EdgeInsets.symmetric(vertical: 0),
              decoration:
                  BoxDecoration(color: NeumorphicTheme.accentColor(context)),
              titleCentered: true,
              leftChevronIcon: Icon(
                Icons.chevron_left,
                size: 22,
                color: Colors.white,
              ),
              rightChevronIcon: Icon(
                Icons.chevron_right,
                size: 22,
                color: Colors.white,
              ),
              titleTextStyle: TextStyle(fontSize: 17, color: Colors.white),
              formatButtonVisible: true,
            ),
            daysOfWeekHeight: 50,
            daysOfWeekStyle: DaysOfWeekStyle(
              decoration: BoxDecoration(
                color: NeumorphicTheme.accentColor(context).withOpacity(0.2),
              ),
              weekdayStyle: kLTwoTextStyle(Colors.black),
              weekendStyle: kLTwoTextStyle(Colors.black),
            ),
            availableCalendarFormats: const {
              CalendarFormat.month: 'Month',
            },
            availableGestures: AvailableGestures.horizontalSwipe,
            onDaySelected: _onDaySelected,
            eventLoader: _getEventsForDay,
            onPageChanged: onPageChanged,
            onCalendarCreated: _onCalendarCreated,
          ),
        ),
      ),
    );
  }

  void _onDaySelected(DateTime? selectedDay, DateTime? focusedDay) async {
    var events = _getEventsForDay(selectedDay);

    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
    }

    // bloc?.getReportScore("6");
    if (events.length > 0) {
      var event = events.last;
      // bloc?.getReportScore(event.id.toString());
    } else {
      // bloc?.reportsScore.add(null);
    }

    // if (events == null || events.isEmpty) {
    //   bloc!.reportsDataController.add(null);
    //
    //   if (_report != null) {
    //     setState(() {
    //       _report = null;
    //     });
    //   }
    //   return;
    // }
    // _report = await widget.homebloc.getReport(sid: events.first.sid);
    // if (mounted) {
    //   setState(() {});
    // }
  }

  Future<void> onPageChanged(DateTime focusedDay) async {
    _focusedDay = focusedDay;
    _selectedDay = _focusedDay!;

    try {
      // List<AllReportsResponseModel> reports =
      // await bloc!.getAllReports(requestModel);
      // for (AllReportsResponseModel session in reports) {
      //   DateTime sessCreated = DateTime.parse(session.date ?? "").toLocal();
      //   sessionReportEvents[sessCreated] = [session];
      // }
      // if (mounted) {
      //   setState(() {});
      // }
    } on Exception catch (e) {
      Log.e("${e.toString()}");
    }
  }

  Future<void> _onCalendarCreated(PageController controller) async {
    await onPageChanged(_focusedDay!);
    _onDaySelected(_selectedDay, null);
  }

  List<AllReportsResponseModel> _getEventsForDay(DateTime? day) {
    return sessionReportEvents[day] ?? [];
  }

  DateTime _firstDayOfMonth(DateTime month) {
    return DateTime.utc(month.year, month.month, 1);
  }

  DateTime _lastDayOfMonth(DateTime month) {
    final date = month.month < 12
        ? DateTime.utc(month.year, month.month + 1, 1)
        : DateTime.utc(month.year + 1, 1, 1);
    return date.subtract(const Duration(days: 1));
  }
}

class AllReportsResponseModel {
  AllReportsResponseModel({
    this.date,
    this.id,
  });

  AllReportsResponseModel.fromJson(dynamic json) {
    date = json['date'];
    id = json['id'];
  }
  String? date;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = date;
    map['id'] = id;
    return map;
  }
}
