mixin ValidationMixin {

  String? validateEmail(String? value) {
    if (!value!.contains('@')) {
      return 'invalid';
    }
    return null;
  }

  String? validatePassword (String? value) {
    if (value!.length < 4) {
      return 'invalid password';
    }
    return null;
  }
}