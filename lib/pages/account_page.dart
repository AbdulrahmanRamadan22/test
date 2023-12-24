// ignore_for_file: invalid_required_named_param

import 'package:flutter/material.dart';
import 'package:login_firebase/pages/home_page.dart';

class AccountPage extends StatelessWidget {
  final double myBalance = 10000;
  final double myBalanceAfterDonating;
  const AccountPage({
    super.key,
    @required this.myBalanceAfterDonating = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => const HomePage()),
                  (Route route) => route == null);
            },
            icon: const Icon(Icons.arrow_back_ios),
            //replace with our own icon data.
          ),
          backgroundColor: Colors.grey,
          centerTitle: true,
          title: const Text("حسابي ")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Container(
          padding: const EdgeInsets.all(20),
          color: Colors.grey[300],
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Text(
              "${myBalance - myBalanceAfterDonating}",
              style: const TextStyle(fontSize: 25),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              ": رصيدك",
              style: TextStyle(fontSize: 25),
            ),
          ]),
        ),
      ),
    );
  }
}
