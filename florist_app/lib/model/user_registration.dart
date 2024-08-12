class UserRegistrationRequest {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final bool isSupplier;

  UserRegistrationRequest(
      {required this.email,
      required this.password,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.isSupplier});
  // Convert the object to a Map
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'isSupplier': isSupplier
    };
  }
}
