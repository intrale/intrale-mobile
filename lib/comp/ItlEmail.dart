import 'package:flutter/material.dart';
import 'package:intrale/comp/ItlInput.dart';
import 'package:intrale/util/validation/Validator.dart';

class ItlEmail extends ItlInput {
  final String descriptionKey;
  final Validator validator;

  ItlEmail({required this.descriptionKey, this.validator = const Validator()})
      : super(
            descriptionKey: descriptionKey,
            password: false,
            icon: Icons.email,
            inputType: TextInputType.emailAddress,
            validator: validator);
}
