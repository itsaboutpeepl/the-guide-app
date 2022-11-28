double getPPLValueFromPence(num penceAmount) {
  return penceAmount / 10;
}

double getPPLRewardsFromPence(num penceAmount) {
  return getPPLValueFromPence((penceAmount * 5) / 100);
}

String getPoundValueFromPPL(num pplAmount) {
  return (pplAmount / 10).toStringAsFixed(2);
}
