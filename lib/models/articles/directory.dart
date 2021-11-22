import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'directory.freezed.dart';
part 'directory.g.dart';

@immutable
@freezed
class Directory with _$Directory {
  const Directory._();

  @JsonSerializable()
  factory Directory({
    required String directoryTitle,
    required String directoryLocation,
    required String directoryCoordinates,
    required String directoryWebsiteURL,
  }) = _Directory;

  factory Directory.fromJson(dynamic json) => _$DirectoryFromJson(json);
}
