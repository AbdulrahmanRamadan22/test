import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_firebase/cuibt/balance_cubit.dart';
import 'package:login_firebase/widgets/defaultButton.dart';
import 'package:login_firebase/widgets/show_toast.dart';
import 'package:login_firebase/widgets/text_field.dart';

class RechargePage extends StatelessWidget {
  const RechargePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("شحن الرصيد"), centerTitle: true),
      body: BlocBuilder<BalanceCubit, BalanceState>(
        // var  key=context.read<BalanceCubit>().formkey,

        builder: (context, state) {
          GlobalKey<FormState> key = context.read<BalanceCubit>().formkey;
          return Form(
            key: key,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  defaultFormField(
                      controller: context.read<BalanceCubit>().shippingBalance,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "shippingBalance  must not be empty";
                        } else if (double.parse(value).toInt() < 0) {
                          return "You must enter a valid number";
                        }
                        return null;
                      },
                      type: TextInputType.number,
                      hint: "Enter the amount "),
                  const SizedBox(
                    height: 40,
                  ),
                  defaultButton(
                      onPressed: () {
                        if (key.currentState!.validate()) {
                          context.read<BalanceCubit>().addBalance(
                              context.read<BalanceCubit>().shippingBalance);

                          showToast(
                              msg: "Your balance has been charged successfully",
                              backgroundColor: Colors.grey);

                              

                          Navigator.pop(context);
                        }
                      },
                      height: 50,
                      radius: 8,
                      width: 300,
                      text: "اتمام  عمليه الشحن"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
