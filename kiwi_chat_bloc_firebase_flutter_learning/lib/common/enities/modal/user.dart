import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/common/values/firebase_key.dart';

class User{
  final  String? userId;
  final String? name;
  final String? email;
  final String? image;
  final List<User>? friends;

 User({this.userId, this.name, this.email, this.image, this.friends});
//handle get friends , add friends , remove friends
 bool addFriend(User user){
   if(!friends!.contains(user)){
     friends?.add(user);
     return true;
   }else{
     return false;
   }
 }

 bool removeFriend(User user){
   if(friends!.contains(user)){
     friends?.remove(user);
     return true;
   }else{
     return false;
   }
 }

 List<User>? getFriends(){
   return friends;
 }
 //handle put user data and get data from Firebase
  factory User.fromFirebase(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options){
   final data = snapshot.data();
   return User(
     userId: data?[FireBaseKey.USER_ID],
     email: data?[FireBaseKey.EMAIL],
     name: data?[FireBaseKey.NAME],
     image: data?[FireBaseKey.IMAGE],
     friends: data?[FireBaseKey.FRIENDS]
   );
 }

 Map<String,dynamic> toFirestore(){
   return{
     if(userId!=null) FireBaseKey.USER_ID:userId,
     if(email!=null) FireBaseKey.EMAIL:email,
     if(name!=null) FireBaseKey.NAME:name,
     if(image!=null) FireBaseKey.IMAGE:image,
     if(friends!=null) FireBaseKey.FRIENDS:userId,
   };
 }


}