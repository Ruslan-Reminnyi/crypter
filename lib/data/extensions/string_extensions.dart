import 'package:crypter/domain/enums/side.dart';

extension StringType on String {
  Side toSide() {
    if (toLowerCase() == Side.long.name) {
      return Side.long;
    } else {
      return Side.short;
    }
  }
}
