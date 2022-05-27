import 'package:conqur/Modules/dashboard/pages/home_page.dart';
import 'package:conqur/Modules/profile/bloc/profile_bloc.dart';
import 'package:conqur/Modules/profile/pages/sidemenu_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        bloc: ProfileBloc.instance,
        builder: (context, state) {
          if (state is ProfileInitialState) {
            return SideMenuPage();
          } else {
            return HomePage(
              state: HomePageState.sensorDisconnected,
            );
          }
        },
      ),
    );
  }
}
