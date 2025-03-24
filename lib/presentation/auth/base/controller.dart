import 'package:flutter/material.dart';

import 'field_type.dart';

abstract class AuthController {
  final formKey = GlobalKey<FormState>();

  late final Map<FieldType, TextEditingController> controllers;

  AuthController(List<FieldType> fields) : controllers = {for (FieldType field in fields) field: TextEditingController()};

  String getFieldValue(FieldType field) {
    if (field == FieldType.password) return controllers[field]?.text ?? '';
    return controllers[field]?.text.trim() ?? '';
  }

  void dispose() {
    for (var controller in controllers.values) {
      controller.dispose();
    }
  }

  Future<bool> authenticate();
}
