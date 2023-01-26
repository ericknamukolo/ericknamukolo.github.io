import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/loading_screen.dart';
import 'package:portfolio/providers/experiences.dart';
import 'package:portfolio/providers/projects.dart';
import 'package:portfolio/providers/skills.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAvy06o6RMyc7cJblmIbskKlNg0bZHgNws",
      messagingSenderId: "825638715348",
      projectId: "portfolio-28840",
      databaseURL: "https://portfolio-28840-default-rtdb.firebaseio.com/",
      appId: "1:825638715348:web:624d4539afbbf8ef93a041",
    ),
  );
  setPathUrlStrategy();
  runApp(const Portfolio());
}

class Portfolio extends StatelessWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Skills()),
        ChangeNotifierProvider(create: (context) => Projects()),
        ChangeNotifierProvider(create: (context) => Experiences()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Erick | Software Engineer',
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Poppins',
          brightness: Brightness.dark,
          bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: Colors.black.withOpacity(0),
          ),
        ),
        home: const LoadingScreen(),
      ),
    );
  }
}
