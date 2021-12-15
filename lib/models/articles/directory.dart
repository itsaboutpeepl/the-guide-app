import 'package:freezed_annotation/freezed_annotation.dart';

part 'directory.freezed.dart';
part 'directory.g.dart';

@freezed
class Directory with _$Directory {
  const Directory._();

  @JsonSerializable()
  factory Directory({
    required String title,
    required String latitude,
    required String longitude,
    required String website,
    required String twitterLink,
    required String instaLink,
    required String facebookLink,
    required String imageURL,
    required String description,
    required String address,
  }) = _Directory;

  factory Directory.fromJson(dynamic json) => _$DirectoryFromJson(json);
}
