class User {
  User({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.password2,
    this.accessToken,
    this.company,
    this.gender,
  });

  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? password2;
  String? accessToken;
  String? company;
  String? gender;

  // ignore: sort_constructors_first
  factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json['first_name'],
        lastName: json['last_name'],
        email: json['email'],
        password: json['password'],
        password2: json['password2'],
        accessToken: json['access'],
        company: json['company'],
        gender: json['gender'],
      );

  Map<String, dynamic> toJson() => {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'password': password,
        'password2': password2,
      };
}
