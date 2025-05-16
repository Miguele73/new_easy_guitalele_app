class GuitaleleUser {
  final String id;
  final String name;
  final String email;
  final String password;
  final String? imageUrl;

  GuitaleleUser({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    this.imageUrl,
  });

  GuitaleleUser copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? imageUrl,
  }) {
    return GuitaleleUser(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'imageUrl': imageUrl,
    };
  }

  factory GuitaleleUser.fromJson(Map<String, dynamic> json) {
    return GuitaleleUser(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      imageUrl: json['imageUrl'] as String?,
    );
  }
  @override
  String toString() {
    return 'GuitaleleUser(id: $id, name: $name, email: $email, password: $password, imageUrl: $imageUrl)';
  }

  @override
  // ignore: hash_and_equals
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GuitaleleUser &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.password == password &&
        other.imageUrl == imageUrl;
  }
}
