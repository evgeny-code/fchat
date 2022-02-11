library dto;

import 'package:fchat/utils.dart';

class Contact {
  late String keyHash;
  late String publicKeyB64;
  late String name;

  Contact({required this.publicKeyB64, required this.name}) {
    keyHash = CryptoUtils.hash(publicKeyB64);
  }

  Contact.ofDB({
    required this.keyHash,
    required this.publicKeyB64,
    required this.name
  });

  @override
  String toString() {
    return 'Contact{keyHash: $keyHash, publicKeyB64: $publicKeyB64, name: $name}';
  }
}
