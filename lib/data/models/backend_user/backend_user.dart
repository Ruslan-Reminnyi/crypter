import 'package:freezed_annotation/freezed_annotation.dart';

part 'backend_user.freezed.dart';
part 'backend_user.g.dart';

@freezed
abstract class BackendUser with _$BackendUser {
  @JsonSerializable(fieldRename: .snake)
  const factory BackendUser({
    int? id,
    required String name,
    required String email,
    DateTime? emailVerifiedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _BackendUser;

  factory BackendUser.fromJson(Map<String, dynamic> json) => _$BackendUserFromJson(json);
}
