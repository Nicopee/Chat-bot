import 'package:dialogflowchatbot/dashboard.dart';
import 'package:dialogflowchatbot/intro.dart';
import 'package:dialogflowchatbot/splashScreen.dart';
import 'package:flutter/material.dart';
import 'chatScreen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'constants/constants.dart';
import 'package:get/get.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dialogflow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: backgroundColor,
          primaryColor: primary,
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: ButtonStyle(
                  side: MaterialStateProperty.all(BorderSide(color: primary)),
                  foregroundColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.disabled)) {
                      return null;
                    }
                    return Color(0xff3D3D3D);
                  }))),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 40, vertical: 14)),
                foregroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.disabled)) {
                    return null;
                  }
                  return Colors.white;
                })),
          ),
          listTileTheme: ListTileThemeData(tileColor: Colors.white),
          brightness: Brightness.light,
          primarySwatch: materialColor,
          colorScheme: ColorScheme.fromSwatch(
              primarySwatch: materialColor, accentColor: secondary),
          textTheme: TextTheme(
              labelSmall: TextStyle(fontWeight: FontWeight.bold),
              titleMedium: TextStyle(fontSize: 16),
              headlineMedium:
                  TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          appBarTheme: AppBarTheme(
            backgroundColor: primary,
            centerTitle: true,
            elevation: 0.0,
            foregroundColor: Colors.black,
            toolbarTextStyle: Theme.of(context).textTheme.headline6?.copyWith(
                  color: Colors.white,
                ),
          )),
      initialRoute: '/splash_screen',
      routes: <String, WidgetBuilder>{
        // '/': (_) => Login(),
        // '/success': (_) => Success(),
        '/splash_screen': (_) => const SplashScreen(),
        // '/password_reset': (_) => ForgotPasswordScreen(),
        '/chat_screen': (_) => const ChatScreen(),
        '/dashboard': (_) => Dashboard(),
        '/intro_page': (_) => Intro(),
        // '/live_tracking': (_) => LiveTracking()
      },
    );
  }
}
