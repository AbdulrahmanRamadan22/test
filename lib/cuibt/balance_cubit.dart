import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'balance_state.dart';

class BalanceCubit extends Cubit<BalanceState> {
  BalanceCubit() : super(BalanceInitial());

  double myBalance = 1000.0;

  var donationAmount = TextEditingController();


  var shippingBalance = TextEditingController();

  

  final formkey = GlobalKey<FormState>();

    final key = GlobalKey<FormState>();


  void donation(donationAmount) {
    myBalance = myBalance - double.parse(donationAmount.text);
    emit(LowBalance());
  }


   void addBalance(shippingBalance) {
    myBalance = myBalance + double.parse(shippingBalance.text);
    emit(AddBalance());
  }
}
