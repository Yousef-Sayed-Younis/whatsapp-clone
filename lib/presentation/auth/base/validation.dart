import 'field_type.dart';

abstract class Validation {
  String? _validate(String value);

  String? validateAll(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Field can't be empty";
    }

    return _validate(value);
  }

  static Validation fromFieldType(FieldType fieldType) {
    return switch (fieldType) {
      FieldType.email => EmailValidation(),
      FieldType.phone => PhoneValidation(),
      FieldType.password => PasswordValidation(),
      FieldType.username => UsernameValidation(),
    };
  }
}

class EmailValidation extends Validation {
  @override
  String? _validate(String value) {
    final emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    return emailRegex.hasMatch(value) ? null : "Please enter a valid email";
  }
}

class PasswordValidation extends Validation {
  @override
  String? _validate(String value) {
    final strongPasswordRegex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');

    return strongPasswordRegex.hasMatch(value)
        ? null
        : "Password must have at least 8 characters, one uppercase, one lowercase, one number, and one special character";
  }
}

class UsernameValidation extends Validation {
  @override
  String? _validate(String value) => value.length >= 3 ? null : "Username must be at least 3 characters";
}

class PhoneValidation extends Validation {
  @override
  String? _validate(String value) {
    final phoneRegex = RegExp(r'^\+?[0-9]{10,15}$');
    return phoneRegex.hasMatch(value) ? null : "Please enter a valid phone number";
  }
}
