abstract class AppEvent{
  const AppEvent();
}


class TriggerBottomNavEvent extends AppEvent{
  final int bttmNavBarIndex;
  const TriggerBottomNavEvent(this.bttmNavBarIndex) : super();
}