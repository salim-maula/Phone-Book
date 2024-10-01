import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  String name;
  final String username;
  final String email;
  String phoneNumber;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phoneNumber,
  });

  //? create an empty user model
  static UserModel empty() => UserModel(
      id: "",
      name: '',
      username: '',
      email: '',
      phoneNumber: '',);

  //? convert model to JSON
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'UserName': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
    };
  }

  //? Factory method to create a UserModel from a FireBase document snapshot
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
          id: document.id,
          name: data['Name'] ?? '',
          username: data['UserName'] ?? '',
          email: data['Email'] ?? '',
          phoneNumber: data['PhoneNumber'] ?? '',);
    }
    return UserModel.empty();
  }
}
