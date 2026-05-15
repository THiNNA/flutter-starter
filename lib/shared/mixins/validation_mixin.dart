/// Mixin for common validation logic that can be shared across multiple forms.
mixin ValidationMixin {
  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}
