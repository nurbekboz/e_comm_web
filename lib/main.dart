import 'package:fhm_globsl/locator.dart';
import 'package:fhm_globsl/service/firebase_options.dart';
import 'package:fhm_globsl/service/network_status_service.dart';
import 'package:fhm_globsl/splashscreen.dart';
import 'package:fhm_globsl/tema.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'homepage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // FirebaseAdMob.instance.initialize(appId: AdMobService().getAdMobAppId());
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<NetworkStatus>(
          create: (context) => NetworkStatusService().networkStatusController.stream,
          initialData: NetworkStatus.Online,
        )
      ],
      child: MaterialApp(
        home: SplashScreen(),
        theme: CustomTheme.lightTheme,
        darkTheme: CustomTheme.darkTheme,
        themeMode: currentTheme.currentTheme,
        // debugShowCheckedModeBanner: true,
        routes: {
          '/home': (context) => HomeNavigator(),
        },
      ),
    );
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.

  print("Handling a background message: ${message.messageId}");
}
