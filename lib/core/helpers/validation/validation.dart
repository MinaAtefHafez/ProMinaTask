abstract class ValidationHelper {
  static String? validationEmpty(String? value) {
    if (value!.isEmpty) {
      return 'Field must not be empty';
    }

    return null;
  }
}
