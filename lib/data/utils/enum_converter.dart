import 'package:json_annotation/json_annotation.dart';

class EnumConverter<T extends Enum> implements JsonConverter<T, String> {
  final List<T> values;

  const EnumConverter(this.values);

  @override
  T fromJson(String enumName) =>
      values.firstWhere((item) => item.name == enumName, orElse: () => values.first);

  @override
  String toJson(T object) => object.name;
}
