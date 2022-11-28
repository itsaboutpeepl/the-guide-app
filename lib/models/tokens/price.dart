import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:guide_liverpool/utils/format.dart';

part 'price.freezed.dart';
part 'price.g.dart';

@immutable
@Freezed()
class Price with _$Price {
  factory Price({
    @Default('usd') String currency,
    @Default('0') String quote,
  }) = _Price;

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);
  const Price._();

  bool get hasPriceInfo => Formatter.isNumeric(quote);
}
