import 'package:bloc/bloc.dart';
import 'package:hello_flutter/quantity/quantity_event.dart';
import 'package:hello_flutter/quantity/quantity_state.dart';

class QuantityBloc extends Bloc<QuantityEvent, QuantityState> {
  QuantityBloc() : super(QuantityState(quantity: 1));

  @override
  Stream<QuantityState> mapEventToState(QuantityEvent event) async* {
    if (event is IncrementEvent) {
      yield QuantityState(quantity: state.quantity + 1);
    } else if (event is DecrementEvent) {
      yield QuantityState(quantity: state.quantity - 1);
    }
  }
}
