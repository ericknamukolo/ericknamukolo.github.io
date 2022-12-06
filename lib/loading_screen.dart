import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/desktop/desktop_body.dart';
import 'package:portfolio/mobile/mobile_body.dart';
import 'package:portfolio/providers/projects.dart';
import 'package:portfolio/providers/skills.dart';
import 'package:portfolio/tablet/tablet_body.dart';
import 'package:portfolio/widgets/responsive_layout.dart';
import 'package:provider/provider.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'constants/responsive_breakpoints.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((_) async {
      await Provider.of<Projects>(context, listen: false).fetchAndSetProjects();
      await Provider.of<Skills>(context, listen: false).fetchSkills();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResponsiveLayout(
            tabletBody: const TabletBody(),
            desktopBody: const DesktopBody(),
            mobileBody: MobileBody(),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kdarkColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _screenWidth > kTabletBreakpoint
                ? Lottie.asset(
                    'assets/loading.json',
                  )
                : LoadingAnimationWidget.bouncingBall(
                    color: kprimaryColor, size: 80.0),
            SizedBox(height: _screenWidth > kTabletBreakpoint ? 0.0 : 10.0),
            const Text(
              'Loading',
              style: kNormalTextStyleWhite,
            )
          ],
        ),
      ),
    );
  }
}
