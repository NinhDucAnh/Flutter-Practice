
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/common/enities/modal/user.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/common/values/firebase_key.dart';

class FireBaseService {
  static void addUserToFireStore(UserChat userChat) async {
    try {
      final auth = FirebaseAuth.instance;
      final firestore = FirebaseFirestore.instance;
      final user = auth.currentUser;
      if(user != null && user.emailVerified){
        await firestore.collection(FireBaseKey.USER).doc(user.uid).set(userChat.toFireStore());
      }
    } catch (e) {
      print('Error storing user data: $e');
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
      FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      final user = auth.currentUser;
      try{
        final snapshot = await firestore.collection(FireBaseKey.USER).doc(user?.uid).get();
        return UserChat.fromFirebase(snapshot, null);
      }catch(e){
        print("Error get current user: $e");
      }
      return null;
  }

  static Future<String?> getCurrentImageUser() async{
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser!;
    try{
      final snapshot = await firestore.collection(FireBaseKey.USER).doc(user.uid).get();
      final data = snapshot.data();
      if(data != null && data.containsKey(FireBaseKey.IMAGE)){
        final currentImageUrl = data[FireBaseKey.IMAGE] as String;
        return currentImageUrl;
      }
    }catch (e){
      print('Error getting current image URL: $e');
    }
    return null;
  }

  static Future<void> deleteImage(String imageUrl) async{
    try{
      FirebaseStorage storage = FirebaseStorage.instance;
      final ref = storage.refFromURL(imageUrl);
      await ref.delete();
    }catch(e){
      print('Error deleting old image: $e');
    }
  }

  static Future<void> updateImageForUser() async{
    try{
      FirebaseStorage storage = FirebaseStorage.instance;
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      final user = FirebaseAuth.instance.currentUser!;
      final currentImageUrl = await getCurrentImageUser();
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if(pickedFile != null){
        final File file = File(pickedFile.path);
        final fileName = '${user.uid}_${DateTime.now().millisecondsSinceEpoch.toString()}';
        final ref = storage.ref().child('images/$fileName');
        await ref.putFile(file);
        final newImageUrl = await ref.getDownloadURL();
        await firestore.collection(FireBaseKey.USER).doc(user.uid).update(({
          FireBaseKey.IMAGE : newImageUrl
        }));
        print('Image updated successfully!');
          // await deleteImage(currentImageUrl!);
      }
    }catch (e){
      print('Error updating image: $e');
    }
  }
}