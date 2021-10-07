import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/desktop/desktop_body.dart';
import 'package:portfolio/loading_screen.dart';
import 'package:portfolio/mobile/mobile_body.dart';
import 'package:portfolio/providers/projects.dart';
import 'package:portfolio/providers/skills.dart';
import 'package:portfolio/tablet/tablet_body.dart';
import 'package:portfolio/widgets/responsive_layout.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Portfolio());
}

class Portfolio extends StatelessWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Skills(),
        ),
        ChangeNotifierProvider(
          create: (context) => Projects(),
        ),
      ],
      child: MaterialApp(
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        theme: ThemeData(
          fontFamily: 'Poppins',
          bottomSheetTheme: BottomSheetThemeData(
              backgroundColor: Colors.black.withOpacity(0)),
        ),
        home: const LoadingScreen(),
      ),
    );
  }
}
