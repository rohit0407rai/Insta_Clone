import 'package:clone_insta/screens/signup_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './utils/colors.dart';
import './responsive/responsive_layout_screen.dart';
import './responsive/mobile_screen_layout.dart';
import './responsive/web_screen_layout.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import './screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //  this is because that flutter widgets should be uploaded before so that app  can be builded
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyC77uvJwyCnP8MyI84BMp2vpRStoSNShLc",
          appId: "1:458357375459:web:72439ca3c663767e1e20d6",
          messagingSenderId: "458357375459",
          projectId: "instagram-tut-1fe0a",
          storageBucket: "instagram-tut-1fe0a.appspot.com"),
    ); //  with  this we just initialize our app but we have to initialize web too so for initializing web we need options
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      // home: ResponsiveLayout(WebScreenLayout(), MobileScreenLayout()));
      home: LoginScreen(),
    );
  }
}
