import 'dart:core';

import 'package:t_store/utils/formatters/formatter.dart';

/// Model class representing user data
class UserModel {
  /// Constructor for UserModel
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  // Keep those value final which we do not need to update
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  /// Helper function to get the fullname
  String get fullName => '$firstName $lastName';

  /// Helper function to format phoneNumber
  String get formattedPhoneNumber => TFormatter.formatPhoneNumber(phoneNumber);

  /// Static function to split fullname into first and last name
  static List<String> nameParts(fullName) => fullName.split("");

  /// Static function to generate a username from the fullname
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split("");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername =
        "$firstName$lastName"; // combine first and last name
    String usernameWithPrefix = "cwt_$camelCaseUsername"; // Add "cwt_" prefix

    return usernameWithPrefix;
  }

  /// Static function to make an empty user model
  static UserModel empty() => UserModel(
        id: "",
        firstName: "",
        lastName: "",
        username: "",
        email: "",
        phoneNumber: "",
        profilePicture: "",
      );

  /// Convert model to JSON structure for storing data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  /// Factory Method to create a UserModel from a firebase document snapshot
  // factory UserModel.fromSnapshot(
  //     DocumentSnapshot<Map<String, dynamic>> document) {
  //   if (document.data() != null) {
  //     final data = document.data()!;
  //     return UserModel(
  //       id: document.id,
  //       firstName: data['FirstName'] ?? "",
  //       lastName: data["LastName"] ?? "",
  //       username: data['Username'] ?? "",
  //       email: data['Email'] ?? "",
  //       phoneNumber: data['PhoneNumber'] ?? "",
  //       profilePicture: data['ProfilePicture'] ?? "",
  //     );
  //   }
  //   return UserModel(
  //     id: dot.id,
  //     firstName: data['FirstName'] ??cumen "",
  //     lastName: data["LastName"] ?? "",
  //     username: data['Username'] ?? "",
  //     email: data['Email'] ?? "",
  //     phoneNumber: data['PhoneNumber'] ?? "",
  //     profilePicture: data['ProfilePicture'] ?? "",
  //   );
  // }
}
