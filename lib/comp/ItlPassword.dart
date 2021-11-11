import 'package:flutter/material.dart';
import 'package:intrale/comp/ItlInput.dart';
import 'package:intrale/util/validation/Validator.dart';

class ItlPassword extends ItlInput {
  final String descriptionKey;
  final Validator validator;

  ItlPassword({required this.descriptionKey, required this.validator})
      : super(
            descriptionKey: descriptionKey,
            password: true,
            icon: Icons.vpn_key,
            inputType: TextInputType.text,
            validator: validator);
}
