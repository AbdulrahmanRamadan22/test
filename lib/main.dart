import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:login_firebase/auth/login.dart';
import 'package:login_firebase/auth/signup.dart';
import 'package:login_firebase/models/Charitie.dart';
import 'package:login_firebase/pages/account_page.dart';
import 'package:login_firebase/pages/donation_page.dart';
import 'package:login_firebase/pages/home_page.dart';

// ./gradlew signinReport
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CharitieAdapter());
  Charitie charitie = Charitie();
  charitie.saveDataOnce(charitie.addCharities());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        ('-----------------------------------------------User is currently signed out!-----------------------------------------');
      } else {
        ('-----------------------------------------------User is signed in!-----------------------------------------');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      home: Login(),
      routes: {
        "Signup": (context) => Signup(),
        "Login": (context) => Login(),
        "HomePage": (context) => const HomePage(),
        "AccountPage": (context) => const AccountPage(),
        "DonationPage": (context) => const DonationPage(),
      },
    );
  }
}
