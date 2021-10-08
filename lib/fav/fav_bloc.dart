import 'package:bloc/bloc.dart';
import 'fav_event.dart';
import 'fav_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteBloc() : super(FavouriteState(pressed: false));

  @override
  Stream<FavouriteState> mapEventToState(FavouriteEvent event) async* {
    if (event is FavouritePressedEvent) {
      yield FavouriteState(pressed: !state.pressed);
    }
  }
}
