import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/password_visibility_service.dart';

final passwordVisibilityNotifierProvider = StateNotifierProvider<PasswordVisibilityNotifier, bool>(
        (ref) => PasswordVisibilityNotifier(ref.watch(passwordVisibilityServiceProvider))
);

class PasswordVisibilityNotifier extends StateNotifier<bool>{
  final PasswordVisibilityService _passwordVisibilityService;
  PasswordVisibilityNotifier(this._passwordVisibilityService) : super(false);

  passwordVisibility() {
    state = !state;
  }
}