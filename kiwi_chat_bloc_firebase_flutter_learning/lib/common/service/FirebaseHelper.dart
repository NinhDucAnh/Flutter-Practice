import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/common/enities/modal/user.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/common/values/firebase_key.dart';

class FireBaseService {
  static void addUserToFireStore(UserChat user) async {
    CollectionReference userCollection = FirebaseFirestore.instance
        .collection(FireBaseKey.USER);
    try {
      QuerySnapshot userSnapshot = await userCollection.where(
          FireBaseKey.EMAIL, isEqualTo: user.email).get();
      if (userSnapshot.docs.isNotEmpty) return;
      await userCollection.add(user.toFireStore());
    } catch (e) {
      print('Error adding user to Firestore: $e');
    }
  }

  static Future<List<UserChat>>  getListUser() async {
    List<UserChat> users = [];
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    return firestore
        .collection(FireBaseKey.USER)
        .get()
        .then((QuerySnapshot<Map<String, dynamic>> usersSnapshot) {
      print("Successfully completed");
      for (var docSnapshot in usersSnapshot.docs) {
        print('${docSnapshot.id} => ${docSnapshot.data()}');
        users.add(UserChat.fromFirebase(docSnapshot, null));
      }
      return users;
    }).catchError((e) {
      print("Error completing: $e");
      return users; // Return an empty list or handle the error case accordingly
    });
  }

  static Future<UserChat?> getCurrentUser() async {
    final user = FirebaseAuth.instance.currentUser!;
    final QuerySnapshot<Map<String, dynamic>> userSnapshot = await FirebaseFirestore.instance
        .collection(FireBaseKey.USER)
        .where(FireBaseKey.USER_ID, isEqualTo: user.uid)
        .get();
    if (userSnapshot.docs.isNotEmpty) {
      final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          userSnapshot.docs.first;
      return UserChat.fromFirebase(documentSnapshot, null);
    } else {
      print('User document does not exist.');
      return null;
    }
  }
}