import 'package:conqur/Modules/dashboard/cards/recents_card.dart';
import 'package:conqur/Modules/dashboard/model/event_response.dart';
import 'package:conqur/helpers/Widgets/base_card.dart';
import 'package:flutter/material.dart';

class ReportEvents extends StatelessWidget {
  String? sessionId;
  bool? isUpdateEnabled;
  ReportEvents({this.sessionId});

  @override
  Widget build(BuildContext context) {
    return NeumorphicCard(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      height: MediaQuery.of(context).size.height * 0.75,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 22,
                itemBuilder: (context, index) {
                  return NeumorphicEventTile(
                    event: EventResponse(
                        name: "Running",
                        imageUrl: null,
                        duration: "00h 45m 32s",
                        isQuickEvent: false,
                        timeSlot: "25/02/2022 - 12:30 AM",
                        day: "HR avg 47"),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
