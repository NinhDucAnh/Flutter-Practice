abstract class ProfileEvent {
  const ProfileEvent();
}

class UpdateName extends ProfileEvent{
  final String name;
  const UpdateName(this.name);
}

class UpdateImage extends ProfileEvent{
  final String imagePath;
  const UpdateImage(this.imagePath);
}

class UpdateEmail extends ProfileEvent{
  final String email;
  const UpdateEmail(this.email);
}