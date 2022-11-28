bool isJsonValEmpty<String>(Map<String, dynamic> json, String keyName) {
  return json.containsValue(keyName) &&
      [null, '', 'NaN'].contains(json[keyName]);
}
