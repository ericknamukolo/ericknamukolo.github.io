import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/desktop/desktop_body.dart';
import 'package:portfolio/mobile/mobile_body.dart';
import 'package:portfolio/providers/projects.dart';
import 'package:portfolio/tablet/tablet_body.dart';
import 'package:portfolio/widgets/responsive_layout.dart';
import 'package:provider/provider.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((_) async {
      await Provider.of<Projects>(context, listen: false).fetchAndSetProjects();
      Navigator.push(
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
    return Scaffold(
      backgroundColor: kdarkColor,
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 200),
            Lottie.asset(
              'assets/loading.json',
            ),
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
