class AppState{
  final int bttmNavBarIndex;

  const AppState({ this.bttmNavBarIndex =0});

  AppState copyWith({int? tabIndex, int? bttmNavBarIndex}){
    return AppState(
      bttmNavBarIndex: bttmNavBarIndex ?? this.bttmNavBarIndex,
    );
  }
}