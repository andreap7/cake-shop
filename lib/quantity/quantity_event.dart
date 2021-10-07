import 'package:hello_flutter/quantity/quantity_state.dart';

abstract class QuantityEvent {}

class IncrementEvent extends QuantityEvent {}

class DecrementEvent extends QuantityEvent {}
