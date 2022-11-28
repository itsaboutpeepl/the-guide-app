import 'package:decimal/decimal.dart';

BigInt toBase(Decimal amount, int decimals) {
  Decimal baseUnit = Decimal.fromInt(10).pow(decimals).toDecimal();

  Decimal inbase = amount * baseUnit;

  return BigInt.parse(inbase.toString());
}

Decimal toDecimal(BigInt amount, int decimals) {
  Decimal baseUnit = Decimal.fromInt(10).pow(decimals).toDecimal();

  var d = Decimal.parse(amount.toString());
  var result = d / baseUnit;

  return result.toDecimal();
}
