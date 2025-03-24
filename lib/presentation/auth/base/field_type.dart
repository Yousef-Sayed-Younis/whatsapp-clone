enum FieldType { email, phone, password, username }

extension FieldTypeExtension on FieldType {
  String get label {
    return switch (this) {
      FieldType.email => "Email",
      FieldType.phone => "Phone",
      FieldType.password => "Password",
      FieldType.username => "Username",
    };
  }
}
