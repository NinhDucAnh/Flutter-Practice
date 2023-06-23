class ProfileState {
   String image;
   String name;
   String email;
   ProfileState({this.image="", this.name="", this.email =""});

   ProfileState copyWith({String? image, String? name, String? email}){
      return ProfileState(
         image: image?? this.image,
         name: name ?? this.name,
         email: email ?? this.email,
      );
   }
}