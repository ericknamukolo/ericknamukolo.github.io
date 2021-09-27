import 'package:flutter/material.dart';
import 'package:portfolio/desktop/desktop_body.dart';
import 'package:portfolio/mobile/mobile_body.dart';
import 'package:portfolio/providers/skills.dart';
import 'package:portfolio/tablet/tablet_body.dart';
import 'package:portfolio/widgets/responsive_layout.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Portfolio());
}

class Portfolio extends StatelessWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => Skills())],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        home: const ResponsiveLayout(
          tabletBody: TabletBody(),
          desktopBody: DesktopBody(),
          mobileBody: MobileBody(),
        ),
      ),
    );
  }
}
