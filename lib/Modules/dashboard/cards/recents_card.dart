import 'package:cached_network_image/cached_network_image.dart';
import 'package:conqur/Modules/dashboard/model/event_response.dart';
import 'package:conqur/helpers/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class RecentsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(depth: 5, intensity: 1),
      child: Container(
        padding: EdgeInsets.only(top: 8, bottom: 5, right: 10, left: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent Training Reports",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500)),
                  ),
                  TextButton(
                    child: Text(
                      "View all",
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 12,
                              color: NeumorphicTheme.accentColor(context))),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            NeumorphicEventTile(
              event: EventResponse(
                  name: "Running",
                  imageUrl: null,
                  duration: "00h 45m 32s",
                  isQuickEvent: false,
                  timeSlot: "25/02/2022 - 12:30 AM",
                  day: "HR avg 47"),
            ),
            NeumorphicEventTile(
              event: EventResponse(
                  name: "Running",
                  imageUrl: null,
                  duration: "00h 45m 32s",
                  isQuickEvent: false,
                  timeSlot: "25/02/2022 - 12:30 AM",
                  day: "HR avg 47"),
            ),
          ],
        ),
      ),
    );
  }
}

class NeumorphicEventTile extends StatelessWidget {
  EventResponse? event;
  NeumorphicEventTile({this.event});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(bottom: 15),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Neumorphic(
                          style: NeumorphicStyle(
                              intensity: 1,
                              depth: 3,
                              boxShape: NeumorphicBoxShape.circle()),
                          child: Container(
                            height: 43,
                            width: 43,
                            child: Center(
                              child: (event?.imageUrl != null &&
                                      event?.imageUrl != "")
                                  ? CachedNetworkImage(
                                      height: 17,
                                      width: 17,
                                      imageUrl: event?.imageUrl ?? "",
                                      fit: BoxFit.contain,
                                      errorWidget: (context, url, error) =>
                                          Container(
                                              height: 18,
                                              child: Container(
                                                child:
                                                    Icon(Icons.error_outline),
                                              )),
                                    )
                                  : SvgPicture.asset(
                                      ImageNames.runningIcon,
                                      height: 17,
                                      width: 17,
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                event?.name ?? "",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.favorite_border,
                                    size: 14,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    event?.day ?? "",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                event?.duration ?? "",
                                // Common.instance.getTimeDifference(
                                //     DateTime.fromMillisecondsSinceEpoch(
                                //         event!.beginTime!),
                                //     DateTime.fromMillisecondsSinceEpoch(
                                //         event!.endTime!),
                                //     isReversed: true),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                event?.timeSlot ?? "",
                                // "${Common.instance.getDateTimeFromTimeStamp(timeStamp: event!.beginTime!, format: "hh:mm")} - ${Common.instance.getDateTimeFromTimeStamp(timeStamp: event!.endTime!, format: "hh:mm aa")}",
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 11),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
