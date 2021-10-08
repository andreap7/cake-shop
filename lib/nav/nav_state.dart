enum NavigationStateStatus {
  initial,
  loading,
  finished,
  refreshed,
}

class NavigationState {
  int index;
  String url;
  NavigationStateStatus? status;

  NavigationState({
    required this.index,
    required this.url,
    required this.status,
  });

  NavigationState copyWith({
    int? index,
    String? url,
    NavigationStateStatus? status,
  }) =>
      NavigationState(
        index: index ?? this.index,
        url: url ?? this.url,
        status: status ?? this.status,
      );
}
