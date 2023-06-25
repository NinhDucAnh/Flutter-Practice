import 'package:flutter/cupertino.dart';

abstract class UserTabEvent {
}

class ButtonClickedEvent extends UserTabEvent{
  final IconData iconData;
  ButtonClickedEvent(this.iconData);
}