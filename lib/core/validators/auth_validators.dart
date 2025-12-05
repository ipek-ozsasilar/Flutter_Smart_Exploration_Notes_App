/// Auth validators for form validation
class AuthValidators {
  AuthValidators._();
  static final AuthValidators instance = AuthValidators._();

  /// Validates name/surname field
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ad soyad gerekli';
    }
    return null;
  }

  /// Validates email field
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'E-posta adresi gerekli';
    }
    if (!value.contains('@')) {
      return 'Geçerli bir e-posta adresi girin';
    }
    return null;
  }

  /// Validates phone number field
  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Telefon numarası gerekli';
    }
    if (value.length < 10) {
      return 'Geçerli bir telefon numarası girin';
    }
    return null;
  }

  /// Validates password field
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Şifre gerekli';
    }
    if (value.length != 6) {
      return 'Şifre 6 haneli olmalı';
    }
    return null;
  }

  /// Validates confirm password field
  String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Şifre tekrarı gerekli';
    }
    if (value != password) {
      return 'Şifreler eşleşmiyor';
    }
    return null;
  }
}
