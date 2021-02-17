class User {
  final String id;
  final String fullName;
  final String email;
  final String role;

  User({this.id, this.fullName, this.email, this.role});

  User.fromData(Map<String, dynamic> data)
      : id = data['id'],
        fullName = data['fullName'],
        email = data['email'],
        role = data['role'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'role': role,
    };
  }
}
