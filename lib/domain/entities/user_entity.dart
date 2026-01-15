
class UserEntity {

  String artistName;
  String email;
  bool emailVisibility;
  String fullName;
  String role;
  String? password;
  String? passwordConfirm;
  bool verified;

  UserEntity({
    required this.artistName,
    required this.email,
    required this.emailVisibility,
    required this.fullName,
    required this.role,
    required this.verified,
     this.password,
     this.passwordConfirm,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
    artistName: json['artist_name'],
    email: json['email'],
    emailVisibility: json['emailVisibility'],
    fullName: json['full_name'],
    role: json['role'],
    verified: json['verified'],
    password: json['password'],
    passwordConfirm: json['passwordConfirm'],
  );

}