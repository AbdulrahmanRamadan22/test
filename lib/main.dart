import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:login_firebase/app_router.dart';
import 'package:login_firebase/models/Charitie.dart';

// ./gradlew signinReport
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CharitieAdapter());
  Charitie charitie = Charitie();
  charitie.saveDataOnce(charitie.addCharities());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Main(
    appRouter: AppRouter(),
  ));
}

class Main extends StatefulWidget {
  final AppRouter appRouter;
  const Main({super.key, required this.appRouter});

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
      onGenerateRoute: widget.appRouter.generateRoute,
    );
  }
}
