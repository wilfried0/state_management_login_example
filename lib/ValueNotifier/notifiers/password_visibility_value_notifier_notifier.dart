import 'package:flutter/material.dart';

class PasswordVisibilityValueNotifier extends ValueNotifier<bool>{
  PasswordVisibilityValueNotifier(super.value);

  void passwordVisibility() {
    value = !value;
    notifyListeners();
  }
}