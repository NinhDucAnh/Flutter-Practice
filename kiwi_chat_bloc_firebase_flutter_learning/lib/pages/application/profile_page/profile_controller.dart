import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/common/service/FirebaseHelper.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/pages/application/profile_page/bloc/profile_bloc.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/pages/application/profile_page/bloc/profile_event.dart';

import '../../../common/values/firebase_key.dart';

class ProfileController{
   final BuildContext context;
   const ProfileController(this.context);

   handleEditImage() async {
      final bloc = context.read<ProfileBloc>();
      try{
         FirebaseStorage storage = FirebaseStorage.instance;
         FirebaseFirestore firestore = FirebaseFirestore.instance;
         final user = FirebaseAuth.instance.currentUser!;
         final picker = ImagePicker();
         final pickedFile = await picker.pickImage(source: ImageSource.gallery);
         if(pickedFile != null){
            final File file = File(pickedFile.path);
            final fileName = '${user.uid}_${DateTime.now().millisecondsSinceEpoch.toString()}';
            final ref = storage.ref().child('images/$fileName');
            await ref.putFile(file);
            await FireBaseService.deleteImage(bloc.state.image);
            final newImageUrl = await ref.getDownloadURL();
            bloc.add(UpdateImage(newImageUrl));
            await firestore.collection(FireBaseKey.USER).doc(user.uid).update(({
               FireBaseKey.IMAGE : newImageUrl
            }));
            print('Image updated successfully!');
         }
      }catch (e){
         print('Error updating image: $e');
      }

   }
}