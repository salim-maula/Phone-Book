import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/authentication/model/user_model.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class HomeRepository extends GetxController {
  static HomeRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  final _auth = FirebaseAuth.instance;
  User? get authUser => _auth.currentUser;

  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot =
          await _db.collection("Users").doc(authUser?.uid).get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw PFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const PFormatException();
    } on PlatformException catch (e) {
      throw PPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  Future<void> addContact(String name, String email, String phoneNumber) async {
    try {
      final contactRef = _db
          .collection('Contacts')
          .doc(authUser?.uid)
          .collection('UserContacts')
          .doc(); // Membuat doc ID baru

      await contactRef.set({
        'id': contactRef.id, 
        'Name': name,
        'Email': email,
        'PhoneNumber': phoneNumber,
      });
    } on FirebaseException catch (e) {
      throw PFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const PFormatException();
    } on PlatformException catch (e) {
      throw PPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  Future<List<Map<String, dynamic>>> getContacts() async {
    try {
      final contactsSnapshot = await _db
          .collection('Contacts')
          .doc(authUser?.uid)
          .collection('UserContacts')
          .get();

      return contactsSnapshot.docs.map((doc) {
        return {
          'id': doc.id,
          'Name': doc['Name'],
          'Email': doc['Email'],
          'PhoneNumber': doc['PhoneNumber'],
        };
      }).toList();
    } on FirebaseException catch (e) {
      throw PFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const PFormatException();
    } on PlatformException catch (e) {
      throw PPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  Future<void> updateContact(
      String contactId, String name, String email, String phoneNumber) async {
    try {
      final userUid = authUser?.uid; 
      final contactRef = _db
          .collection('Contacts')
          .doc(userUid)
          .collection('UserContacts')
          .doc(contactId);

      await contactRef.update({
        'Name': name,
        'Email': email,
        'PhoneNumber': phoneNumber,
      });
    } on FirebaseException catch (e) {
      throw PFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const PFormatException();
    } on PlatformException catch (e) {
      throw PPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  Future<bool> deleteContact(String contactId) async {
    try {
      final userUid = authUser?.uid; 
      final contactRef = _db
          .collection('Contacts')
          .doc(userUid)
          .collection('UserContacts')
          .doc(contactId);

      await contactRef.delete();
      return true; // Berhasil
    } on FirebaseException catch (_) {
      return false;
    } on FormatException catch (_) {
      return false;
    } on PlatformException catch (_) {
      return false;
    } catch (_) {
      return false; 
    }
  }
}
