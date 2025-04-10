import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    /// The user's ID.
    required String id,

    /// The user's name.
    required String name,

    /// The user's email.
    required String email,

    /// The user's picture URL.
    String? picture,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) => _$UserModelFromJson(json);
}

extension UserExtension on UserModel {
  String get initials {
    final words = name.split(' ');
    return (words.singleOrNull ?? '${words.first[0]}${words.last[0]}').trim();
  }

  String get initialsWithSpace {
    final words = name.split(' ');
    return (words.singleOrNull ?? '${words.first[0]} ${words.last[0]}').trim();
  }

  String get displayName {
    final words = name.split(' ');
    return (words.singleOrNull ?? '${words.first} ${words.last}').trim();
  }
}
