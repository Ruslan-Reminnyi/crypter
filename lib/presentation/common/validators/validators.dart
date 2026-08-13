import 'package:crypter/presentation/common/validators/input_error.dart';

class Validators {
  static InputError? intInput(String? value) {
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

  static InputError? name(String? value) {
    if (value == null || value.trim().isEmpty) {
      return EmptyInputError();
    }
    return null;
  }

  static InputError? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return EmptyInputError();
    }
    final regEx = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    );
    if (!regEx.hasMatch(value)) {
      return InvalidEmailFormatError();
    }
    return null;
  }

  static InputError? password(String? value) {
    if (value == null || value.trim().isEmpty) {
      return EmptyInputError();
    }
    if (value.length < 8) {
      return InvalidPasswordFormatError();
    }
    return null;
  }

  static InputError? confirmPassword(String? value, String? password) {
    if ((value == null || value.trim().isEmpty) && (password == null || password.trim().isEmpty)) {
      return EmptyInputError();
    }
    if (value != password) {
      return InvalidConfirmPasswordFormatError();
    }
    return null;
  }

  static InputError? prompt(String? value) {
    if (value == null || value.trim().isEmpty) {
      return EmptyInputError();
    }
    if (value.length < 20) {
      return InvalidPromptFormatError();
    }
    return null;
  }
}
