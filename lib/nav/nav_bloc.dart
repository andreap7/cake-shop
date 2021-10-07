import 'package:bloc/bloc.dart';

import 'nav_event.dart';
import 'nav_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState(index: 0));

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if (event is ButtonClickedEvent) {
      yield* _clicked(event);
    }
  }

  Stream<NavigationState> _clicked(ButtonClickedEvent event) async* {
    yield NavigationState(index: event.index);
  }
}
