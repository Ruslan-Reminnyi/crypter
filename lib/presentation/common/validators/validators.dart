import 'package:crypter/presentation/common/validators/input_error.dart';

class Validators {
  static InputError? orderNumber(String? value) {
    if (value == null || value.isEmpty) {
      return EmptyInputError();
    }
    final regEx = RegExp(r'^[0-9]*$');
    if (!regEx.hasMatch(value)) {
      return InvalidIntFormatError();
    }
    return null;
  }

  static InputError? doubleInput(String? value, {bool isRequired = true}) {
    if (value == null || value.isEmpty) {
      return isRequired ? EmptyInputError() : null;
    }
    final regEx = RegExp(r'^\d+(\.\d+)?$');
    if (!regEx.hasMatch(value)) {
      return InvalidIntOrDoubleFormatError();
    }
    return null;
  }

  static InputError? dateTime(String? value, {bool isRequired = true}) {
    if (value == null || value.isEmpty) {
      return isRequired ? EmptyInputError() : null;
    }
    final dateTimeRegEx = RegExp(
      r'^\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]) ([01]\d|2[0-3]):[0-5]\d$',
    );
    if (!dateTimeRegEx.hasMatch(value)) {
      return InvalidDateTimeFormatError();
    }
    final dateTime = DateTime.tryParse(value);
    if (dateTime == null) {
      return DateTimeDoesNotExistError();
    }
    return null;
  }

  static InputError? leverage(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    final regEx = RegExp(r'^[1-9]\d*:[1-9]\d*$');
    if (!regEx.hasMatch(value)) {
      return InvalidLeverageFormatError();
    }
    return null;
  }

  static InputError? realizedPnL(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    final regEx = RegExp(r'^[-+]\d+(\.\d+)?$');
    if (!regEx.hasMatch(value)) {
      return InvalidRealizedPnLFormatError();
    }
    return null;
  }
}
