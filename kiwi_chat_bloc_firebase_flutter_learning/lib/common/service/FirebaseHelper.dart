import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/common/enities/modal/user.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/common/values/firebase_key.dart';

class FireBaseService{
  final FirebaseFirestore firestore = FirebaseFirestore.instance ;

  static void addUserToFireStore(UserChat user) async {
    CollectionReference userCollection = FirebaseFirestore.instance
        .collection(FireBaseKey.USER);
    try {
      await userCollection.add(user.toFireStore());
      print('User added to Firestore');
    } catch (e) {
      print('Error adding user to Firestore: $e');
    }
  }
}