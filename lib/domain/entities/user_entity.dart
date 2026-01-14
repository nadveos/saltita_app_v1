
class UserEntity {

  String artistName;
  String collectionId;
  String collectionName;
  String email;
  bool emailVisibility;
  String fullName;
  String id;
  String role;
  bool verified;

  UserEntity({
    required this.artistName,
    required this.collectionId,
    required this.collectionName,
    required this.email,
    required this.emailVisibility,
    required this.fullName,
    required this.id,
    required this.role,
    required this.verified,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
    artistName: json['artistName'],
    collectionId: json['collectionId'],
    collectionName: json['collectionName'],
    email: json['email'],
    emailVisibility: json['emailVisibility'],
    fullName: json['fullName'],
    id: json['id'],
    role: json['role'],
    verified: json['verified'],
  );

}