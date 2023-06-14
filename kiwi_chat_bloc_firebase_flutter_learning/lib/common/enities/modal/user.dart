import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/common/values/firebase_key.dart';

class UserChat{
  final  String? userId;
  final String? name;
  final String? email;
  final String? image;
  final List<UserChat>? friends;

 UserChat({this.userId, this.name, this.email, this.image, this.friends});
//handle get friends , add friends , remove friends
 bool addFriend(UserChat user){
   if(!friends!.contains(user)){
     friends?.add(user);
     return true;
   }else{
     return false;
   }
 }

 bool removeFriend(UserChat user){
   if(friends!.contains(user)){
     friends?.remove(user);
     return true;
   }else{
     return false;
   }
 }

 List<UserChat>? getFriends(){
   return friends;
 }


  factory UserChat.fromFirebase(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options){
   final data = snapshot.data();
   List<UserChat> friends = List<UserChat>.from(data?[FireBaseKey.FRIENDS]);
   print(friends.runtimeType.toString());
   return UserChat(
     userId: data?[FireBaseKey.USER_ID],
     email: data?[FireBaseKey.EMAIL],
     name: data?[FireBaseKey.NAME],
     image: data?[FireBaseKey.IMAGE],
     friends: friends,
   );
 }

 Map<String,Object?> toFireStore(){
   return{
     if(userId!=null) FireBaseKey.USER_ID:userId,
     if(email!=null) FireBaseKey.EMAIL:email,
     if(name!=null) FireBaseKey.NAME:name,
     if(image!=null) FireBaseKey.IMAGE:image,
     if(friends!=null) FireBaseKey.FRIENDS:friends,
   };
 }


}