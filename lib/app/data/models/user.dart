class User {
  User(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.password2,
      this.accessToken});

  String firstName;
  String lastName;
  String email;
  String password;
  String password2;
  String? accessToken;

  // ignore: sort_constructors_first
  factory User.fromJson(Map<String, dynamic> json) => User(
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      password: json['password'],
      password2: json['password2'],
      accessToken: json['access']);

  Map<String, dynamic> toJson() => {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'password': password,
        'password2': password2
      };
}
