import 'package:contacts_service/contacts_service.dart';
import 'package:guide_liverpool/models/community/business.dart';
import 'package:guide_liverpool/utils/format.dart';
import 'package:guide_liverpool/utils/phone.dart';

Contact? getContact(
  String? accountAddress,
  Map<String, String> reverseContacts,
  List<Contact>? contacts,
  String countryCode,
) {
  if (accountAddress == null) {
    return null;
  }
  if (reverseContacts.containsKey(accountAddress.toLowerCase())) {
    String? phoneNumber = reverseContacts[accountAddress.toLowerCase()];
    if (contacts == null) return null;
    for (Contact? contact in contacts) {
      for (Item contactPhoneNumber in (contact!.phones!.toList())) {
        if (clearNotNumbersAndPlusSymbol(contactPhoneNumber.value ?? '') == phoneNumber) {
          return contact;
        }
        if (formatPhoneNumber(contactPhoneNumber.value ?? '', countryCode) == phoneNumber) {
          return contact;
        }
      }
    }
  }
  return null;
}

String? deducePhoneNumber(
  String? accountAddress,
  Map<String, String> reverseContacts, {
  List<Business?>? businesses,
}) {
  if (accountAddress == null) {
    return null;
  }
  if (businesses != null && businesses.isNotEmpty) {
    Business? business = businesses.firstWhere(
      (business) => business?.account == accountAddress,
    );
    if (business != null) {
      return business.name;
    }
  }
  if (reverseContacts.containsKey(accountAddress.toLowerCase())) {
    return reverseContacts[accountAddress.toLowerCase()];
  } else {
    return Formatter.formatEthAddress(accountAddress);
  }
}
