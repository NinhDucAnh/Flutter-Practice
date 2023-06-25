import 'package:flutter/cupertino.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/common/enities/modal/add_friend.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/common/service/FirebaseHelper.dart';

import '../../../../common/enities/modal/user.dart';

class UserTabController{
  final BuildContext context;
  const UserTabController(this.context);

  Future<void> handleAddFriend(UserChat receiver)async {
    final sender = await FireBaseService.getCurrentUser();
    final senderAdd = AddFriend(user: sender,type: true);
    final receiverAdd = AddFriend(user: receiver,type: false);
    FireBaseService.sendRequestFriend(senderAdd, receiverAdd);
  }
}