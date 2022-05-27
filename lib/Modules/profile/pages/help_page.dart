import 'package:conqur/Modules/profile/pages/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  List<String> option = [
    "FAQs",
    "User Guide",
    "Tech Support",
    "Deactivate account"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            //Top navigition icon and title
            Header(title: "HELP"),
            const SizedBox(
              height: 40,
            ),
            //List Container
            Neumorphic(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.45,
                padding: EdgeInsets.all(20),
                child: ListView.builder(
                    itemCount: option.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          ListTile(
                            title: Text(
                              option[index],
                              style: GoogleFonts.roboto(fontSize: 20),
                            ),
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.keyboard_arrow_right_outlined,
                                size: 30,
                              ),
                              color: Colors.black.withOpacity(0.4),
                              onPressed: () {},
                            ),
                          ),
                          Divider(
                            color: const Color(0xff707070).withOpacity(0.2),
                          )
                        ],
                      );
                    }),
              ),
            )
          ],
        ),
      )),
    );
  }
}
