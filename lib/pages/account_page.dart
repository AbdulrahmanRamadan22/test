// ignore_for_file: invalid_required_named_param

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_firebase/cuibt/balance_cubit.dart';
import 'package:login_firebase/pages/home_page.dart';
import 'package:login_firebase/widgets/defaultButton.dart';

class AccountPage extends StatelessWidget {
  // final double myBalance = 10000;
  // final double myBalanceAfterDonating;
  const AccountPage({
    super.key,
    // @required this.myBalanceAfterDonating = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("HomePage", (route) => false);
            },
            icon: const Icon(Icons.arrow_back_ios),
            //replace with our own icon data.
          ),
          backgroundColor: Colors.grey,
          centerTitle: true,
          title: const Text("حسابي ")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.grey[300],
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                BlocBuilder<BalanceCubit, BalanceState>(
                  builder: (context, state) {
                    return Text(
                      "${context.read<BalanceCubit>().myBalance}",
                      style: const TextStyle(fontSize: 25),
                    );
                  },
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
            const SizedBox(
              height: 50,
            ),
            defaultButton(
                color: Colors.grey[200],
                onPressed: () {
                  Navigator.of(context).pushNamed("RechargePage");
                },
                text: "شحن رصيدك",
                
                height: 50,
                width: 250),
          ],
        ),
      ),
    );
  }
}
