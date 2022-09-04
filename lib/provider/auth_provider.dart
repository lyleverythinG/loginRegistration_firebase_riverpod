import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final provider = ChangeNotifierProvider(
  (ref) => AuthProvider(),
);

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get user => _firebaseAuth.currentUser;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _obscure = false;
  bool get obscure => _obscure;
  bool _obscureConfirm = false;
  bool get obscureConfirm => _obscureConfirm;
  set obscure(bool obscure) {
    _obscure = obscure;
    notifyListeners();
  }

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  set obscureConfirm(bool obscureConfirm) {
    _obscureConfirm = obscureConfirm;
    notifyListeners();
  }

  String _email = '';
  String get email => _email;

  set email(String email) {
    _email = email;
    notifyListeners();
  }

  String _password = '';
  String get password => _password;
  set password(String password) {
    _password = password;
    notifyListeners();
  }

  String _confirmPassord = '';
  String get confirmPassword => _confirmPassord;
  set confirmPassword(String confirmPassord) {
    _confirmPassord = confirmPassord;
    notifyListeners();
  }

  bool _obscurePassword = true;
  bool get obscurePassword => _obscurePassword;
  set obscurePassword(bool obscureText) {
    _obscurePassword = obscureText;
    notifyListeners();
  }

  bool _obscureConfirmPassword = true;
  bool get obscureConfirmPassword => _obscureConfirmPassword;
  set obscureConfirmPassword(bool obscureConfirmPassword) {
    _obscureConfirmPassword = obscureConfirmPassword;
    notifyListeners();
  }

  Future<void> register() async {
    isLoading = true;
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      isLoading = false;
    } on FirebaseAuthException catch (e) {
      isLoading = false;

      if (e.code == "weak-password") {
        return Future.error('weak pass');
      } else {
        return Future.error(e.message ?? "");
      }
    } catch (e) {
      isLoading = false;
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> login() async {
    isLoading = true;
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      isLoading = false;
    } on FirebaseAuthException catch (e) {
      print(e.code);
      isLoading = false;

      if (e.code == "wrong-password") {
        return Future.error('Wrong Pass');
      } else if (e.code == "user-not-found") {
        return Future.error('User not found');
      } else {
        return Future.error(e.message ?? "");
      }
    } catch (e) {
      isLoading = false;

      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}
