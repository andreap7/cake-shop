abstract class NavigationEvent {}

class ButtonClickedEvent extends NavigationEvent {
  final int index;

  ButtonClickedEvent({
    required this.index,
  });
}
