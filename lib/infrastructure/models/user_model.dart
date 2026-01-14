class User {
    String artistName;
    String collectionId;
    String collectionName;
    String email;
    bool emailVisibility;
    String fullName;
    String id;
    String role;
    bool verified;

    User({
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

    User copyWith({
        String? artistName,
        String? collectionId,
        String? collectionName,
        String? email,
        bool? emailVisibility,
        String? fullName,
        String? id,
        String? role,
        bool? verified,
    }) => 
        User(
            artistName: artistName ?? this.artistName,
            collectionId: collectionId ?? this.collectionId,
            collectionName: collectionName ?? this.collectionName,
            email: email ?? this.email,
            emailVisibility: emailVisibility ?? this.emailVisibility,
            fullName: fullName ?? this.fullName,
            id: id ?? this.id,
            role: role ?? this.role,
            verified: verified ?? this.verified,
        );
}
