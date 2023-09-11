import 'package:flutter_riverpod/flutter_riverpod.dart';

final passwordVisibilityNotifierProvider = StateNotifierProvider<PasswordVisibilityRiverpodNotifier, bool>(
        (ref) => PasswordVisibilityRiverpodNotifier()
);

class PasswordVisibilityRiverpodNotifier extends StateNotifier<bool>{
  PasswordVisibilityRiverpodNotifier() : super(false);

  void passwordVisibility() {
    state = !state;
  }
}