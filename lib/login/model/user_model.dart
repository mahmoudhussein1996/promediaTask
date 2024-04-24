class User {
  final int? id;
  final String? name;
  final String? email;
  final String? emailVerifiedAt;
  final String? createdAt;
  final String? updatedAt;
  final String? token;

  User({
     this.id,
     this.name,
     this.email,
     this.emailVerifiedAt,
     this.createdAt,
     this.updatedAt,
     this.token,
  });

  factory User.fromJson(Map<String, dynamic> json)
  {
    return User(
      id: json['user']['id'],
      name: json['user']['name'],
      email: json['user']['email'],
      emailVerifiedAt: json['user']['email_verified_at'],
      createdAt: json['user']['created_at'],
      updatedAt: json['user']['updated_at'],
      token: json['token'],
    );

}

}
