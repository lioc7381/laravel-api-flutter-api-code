import 'package:flutter/material.dart';
import '../../services/api.dart';

class AuthProvider extends ChangeNotifier {
  bool isAuthenticated = false;
  ApiService apiService = ApiService();

  AuthProvider();

  Future<String> register(
    String name,
    String email,
    String password,
    String passwordConfirmation,
    String deviceName,
  ) async {
    String token = await apiService.register(
      name,
      email,
      password,
      passwordConfirmation,
      deviceName,
    );
    isAuthenticated = true;
    notifyListeners();

    return token;
  }
}
