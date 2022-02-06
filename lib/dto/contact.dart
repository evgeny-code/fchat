library dto;

import 'package:fchat/utils.dart';

class Contact {
  late String keyHash;
  late String publicKeyB64;
  late String name;

  Contact({required this.publicKeyB64, required this.name}) {
    keyHash = CryptoUtils.hash(publicKeyB64);
  }
}
