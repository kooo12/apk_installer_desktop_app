class TpsValidator {
  // Empty Text validation
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required.';
    }
    final regex = RegExp(r'\p{L}', unicode: true);
    if (!regex.hasMatch(value)) {
      return 'You must contain at least one letter';
    }
    return null;
  }

  static String? validateNameText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required.';
    }
    final regex = RegExp(r'\p{L}', unicode: true);
    if (!regex.hasMatch(value)) {
      return 'Name must contain at least one letter';
    }
    return null;
  }

  static String? validateDay(String? value) {
    // final number = int.tryParse(value!);
    //  if (value.isEmpty) {
    //   return '$fieldName is required.';
    // }
    // if (number == null || number < 1 || number > 31) {
    //   return 'Please enter a valid day';
    // }
    if (value == null || value.isEmpty) {
      return '';
    }
    return null;
  }

  static String? validateMonth(String? value) {
    // final number = int.tryParse(value!);
    //  if (value.isEmpty) {
    //   return '$fieldName is required.';
    // }
    // if (number == null || number < 1 || number > 12) {
    //   return 'Please enter a valid month';
    // }
    if (value == null || value.isEmpty) {
      return '';
    }
    return null;
  }

  static String? validateYear(String? value) {
    // final number = int.tryParse(value!);
    // final currentYear = DateTime.now().year;
    // if (value.isEmpty) {
    //   return '$fieldName is required.';
    // }
    // if(number == null || value.length < 4 || number > currentYear){
    //   return 'Please enter a valid year';
    // }
    if (value == null || value.isEmpty) {
      return '';
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address.';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }

    // Check for minimum password length
    if (value.length < 6) {
      return 'Password must be at least 6 characters long.';
    }

    // Check for uppercase letters
    // if (!value.contains(RegExp(r'[A-Z]'))) {
    //   return 'Password must contain at least one uppercase letter.';
    // }

    // Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number.';
    }

    // Check for special characters
    // if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    //   return 'Password must contain at least one special character.';
    // }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required.';
    }

    // Regular expression for phone number validation (assuming a 9-digit MM phone number format)
    final phoneRegExp = RegExp(r'^\d{10,11}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Invalid phone number.';
    }

    return null;
  }
}
