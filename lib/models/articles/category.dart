import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Category with _$Category {
  const Category._();

  @JsonSerializable()
  factory Category({
    required int categoryID,
    required String categoryName,
  }) = _Category;

  factory Category.fromJson(dynamic json) => _$CategoryFromJson(json);
}
