import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/common/enities/modal/user.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/common/values/firebase_key.dart';

class AddFriend{
  final UserChat? user;
  final bool? type;

  AddFriend({this.user, this.type});

  factory AddFriend.fromFirebase(DocumentSnapshot<Map<String,dynamic>> snapshot, SnapshotOptions? options){
    final data = snapshot.data();
    final user = UserChat.fromFirebase(snapshot, options);
    return AddFriend(
      user: data?[FireBaseKey.USER_ADD_FRIEND],
      type: data?[FireBaseKey.TYPE_ADD_FRIEND],
    );
  }

  Map<String,dynamic> toFireStore(){
    return{
      if(user != null) FireBaseKey.USER_ADD_FRIEND : user!.toFireStore(),
      if(type != null) FireBaseKey.TYPE_ADD_FRIEND : type,
    };
  }
}