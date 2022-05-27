import 'package:conqur/Modules/report/model/report_detail_model.dart';
import 'package:conqur/helpers/Widgets/HeaderView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportDetailPage extends StatelessWidget {
  ReportDetailModel? model = reportDetails;
  // ReportDetailPage({this.model});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HeaderView(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                title: model?.activityName ?? "",
              ),
              ReportDurationView(model: model),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: model?.insights.length ?? 0,
                  itemBuilder: (context, index) {
                    return InsightsRowView(
                      model: model!.insights[index],
                    );
                  }),
              SizedBox(
                height: 30,
              ),
              Text(
                "HeartRate zones",
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReportDurationView extends StatelessWidget {
  const ReportDurationView({
    Key? key,
    required this.model,
  }) : super(key: key);

  final ReportDetailModel? model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                model?.startTime ?? "7:55 AM",
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.5)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Started",
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(fontSize: 19, color: Colors.black),
                ),
              ),
            ],
          ),
          Text(
            model?.duration ?? "01h 30m",
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: NeumorphicTheme.accentColor(context)),
            ),
          ),
          Column(
            children: [
              Text(
                model?.endTime ?? "9:30 PM",
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.5)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Ended",
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(fontSize: 19, color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class InsightsRowView extends StatelessWidget {
  InsightsRowModel? model;

  InsightsRowView({this.model});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              model?.title ?? "",
              textAlign: TextAlign.end,
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.3)),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(flex: 1, child: SvgPicture.asset(model?.image ?? "")),
          SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text(
                  model?.value ?? "",
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.5)),
                  ),
                ),
                Text(
                  model?.unit ?? "",
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.5)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
