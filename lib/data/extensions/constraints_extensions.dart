import 'package:crypter/domain/enums/form_factor.dart';
import 'package:material_ui/material_ui.dart';

extension ConstraintsType on BoxConstraints {
  FormFactor get formFactor => FormFactor.fromWidth(maxWidth);
}
