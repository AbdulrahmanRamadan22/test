import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:login_firebase/auth/login.dart';
import 'package:login_firebase/auth/signup.dart';
import 'package:login_firebase/cuibt/balance_cubit.dart';
import 'package:login_firebase/pages/account_page.dart';
import 'package:login_firebase/pages/donation_page.dart';
import 'package:login_firebase/pages/home_page.dart';
import 'package:login_firebase/pages/recharge.dart';

class AppRouter {
  late BalanceCubit balanceCubit;
  AppRouter() {
    balanceCubit = BalanceCubit();
  }

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => Login(),
        );
      case "Signup":
        return MaterialPageRoute(
          builder: (context) => Signup(),
        );

      case "HomePage":
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case "AccountPage":
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: balanceCubit,
            child: const AccountPage(),
          ),
        );
      case "DonationPage":
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: balanceCubit,
            child: const DonationPage(),
          ),
        );

      case "RechargePage":
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: balanceCubit,
            child: const RechargePage(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
