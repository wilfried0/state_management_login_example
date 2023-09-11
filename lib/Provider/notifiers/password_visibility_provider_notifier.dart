import 'package:flutter/material.dart';

class PasswordVisibilityProviderNotifier extends ChangeNotifier{
  bool _isHidden = false;
  bool get isHidden => _isHidden;

  void passwordVisibility() {
    _isHidden = !_isHidden;
    notifyListeners();
  }
}