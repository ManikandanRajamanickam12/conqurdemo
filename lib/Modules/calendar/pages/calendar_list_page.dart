import 'package:conqur/Modules/calendar/bloc/calendar_bloc.dart';
import 'package:conqur/Modules/calendar/cards/calendar_card.dart';
import 'package:conqur/Modules/calendar/cards/report_events.dart';
import 'package:conqur/helpers/Widgets/CustomToggle.dart';
import 'package:conqur/helpers/Widgets/HeaderView.dart';
import 'package:conqur/helpers/Widgets/PrimaryButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

enum ReportViewType { list, calendar }

extension IReportViewType on ReportViewType {
  String get type {
    switch (this) {
      case ReportViewType.list:
        return "Week";
      case ReportViewType.calendar:
        return "Month";
    }
  }

  ReportViewType getType(int index) {
    switch (index) {
      case 0:
        return ReportViewType.list;
      case 1:
        return ReportViewType.calendar;
      default:
        return ReportViewType.list;
    }
  }

  int get index {
    switch (this) {
      case ReportViewType.list:
        return 0;
      case ReportViewType.calendar:
        return 1;
    }
  }
}

class ReportListPage extends StatelessWidget {
  ReportViewType type;
  ReportListPage({required this.type});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 7, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: HeaderView(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  title: "REPORT LIST",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CalendarToggle(
                      selectedIndex: type.index,
                    ),
                  ],
                ),
              ),
              if (type == ReportViewType.list)
                ReportEvents()
              else
                CalendarPage(),
            ],
          ),
        ),
      ),
    );
  }
}

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        CalendarCard(),
        SizedBox(
          height: 30,
        ),
        PrimaryButton(
          onPressed: () {},
          title: "VIEW TRAINING REPORT",
        )
      ],
    );
  }
}

class CalendarToggle extends StatefulWidget {
  var selectedIndex = 0;
  CalendarToggle({required this.selectedIndex});
  @override
  State<CalendarToggle> createState() => _CalendarToggleState();
}

class _CalendarToggleState extends State<CalendarToggle> {
  ReportViewType option = ReportViewType.list;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    option = option.getType(widget.selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomNeumorphicToggle(
        height: 40,
        width: 100,
        selectedIndex: widget.selectedIndex,
        style: CustomNeumorphicToggleStyle(depth: -5),
        children: [
          CustomToggleElement(
              background: Center(
                  child: Icon(
                Icons.list_outlined,
                color: Colors.black.withOpacity(0.3),
                size: 18,
              )),
              foreground: Center(
                  child: Icon(
                Icons.list_outlined,
                size: 18,
              ))),
          CustomToggleElement(
              background: Center(
                  child: Icon(
                Icons.calendar_today_outlined,
                color: Colors.black.withOpacity(0.3),
                size: 18,
              )),
              foreground: Center(
                  child: Icon(
                Icons.calendar_today_outlined,
                size: 18,
              ))),
        ],
        thumb: Neumorphic(
          style: NeumorphicStyle(
              depth: 5,
              intensity: 1,
              boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(12))),
        ),
        onChanged: (value) {
          option = option.getType(value);
          widget.selectedIndex = value;
          CalendarBloc.instance.add(CalendarListEvent(type: option));
          setState(() {});

          print("${value}");
        },
      ),
    );
  }
}
