import 'package:flutter/material.dart';

import '../base/controller.dart';
import '../base/field_type.dart';
import '../base/validation.dart';

class CustomTextFormField extends StatefulWidget {
  final IconData icon;
  final FieldType fieldType;
  final AuthController controller;
  const CustomTextFormField({super.key, required this.icon, required this.fieldType, required this.controller});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isObscured = true;
  late final Validation _validation;
  late final TextEditingController _controller;

  bool get _isPassword => widget.fieldType == FieldType.password;

  IconButton _buildObscureEye() {
    return IconButton(
      onPressed: () => setState(() => _isObscured = !_isObscured),
      icon: Icon(_isObscured ? Icons.visibility_off_rounded : Icons.visibility_rounded),
    );
  }

  bool isObscured() => _isPassword && _isObscured;

  @override
  void initState() {
    super.initState();
    _validation = Validation.fromFieldType(widget.fieldType);
    _controller = widget.controller.controllers[widget.fieldType]!;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      validator: _validation.validateAll,
      obscureText: _isPassword ? _isObscured : false,
      decoration: InputDecoration(
        hintMaxLines: 1,
        prefixIcon: Icon(widget.icon),
        labelText: widget.fieldType.label,
        hintText: "Enter your ${widget.fieldType.label}",
        suffixIcon: _isPassword ? _buildObscureEye() : null,
      ),
    );
  }
}
