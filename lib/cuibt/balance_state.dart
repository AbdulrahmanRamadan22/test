part of 'balance_cubit.dart';

@immutable
abstract class BalanceState {}

class BalanceInitial extends BalanceState {}

// class ChangeBalance extends BalanceState {}


class LowBalance extends BalanceState {}

class AddBalance extends BalanceState {}



