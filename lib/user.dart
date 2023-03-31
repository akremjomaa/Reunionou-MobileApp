class User {
  final int id;
  final String name;
  final String firstname;
  final String email;
  final String password;
  final String status;
  

  const User(
    this.id,
    this.name,
    this.firstname,
    this.email,
    this.password,
    this.status,
  );

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['id'],
      json['name'],
      json['firstname'],
      json['email'],
      json['password'],
      json['status'],
    );
  }
}