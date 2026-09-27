import 'package:crypter/domain/enums/form_factor.dart';
import 'package:flutter/material.dart';

extension ConstraintsType on BoxConstraints {
  FormFactor get formFactor => FormFactor.fromWidth(maxWidth);
}
