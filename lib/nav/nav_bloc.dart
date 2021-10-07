import 'package:bloc/bloc.dart';

import 'nav_event.dart';
import 'nav_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState(index: 0, url: _getUrl(0)));

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if (event is ButtonClickedEvent) {
      yield* _clicked(event);
    }
  }

  Stream<NavigationState> _clicked(ButtonClickedEvent event) async* {
    yield NavigationState(index: event.index, url: _getUrl(event.index));
  }
}

String _getUrl(int index) {
  switch (index) {
    case 0:
      return 'assets/cake_red.png';
    case 1:
      return 'assets/cake_green.png';
    case 2:
      return 'assets/cake_blue.png';
    case 3:
      return 'assets/cake_yellow.png';
    default:
      return 'assets/cake_red.png';
  }
}
