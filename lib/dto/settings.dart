import 'package:fchat/utils.dart';

class Settings {
  late String serverUrl;

  late String privateKeyB64;
  late String publicKeyB64;
  late String publicKeyHash;

  Settings(
      {required this.serverUrl,
      required this.privateKeyB64,
      required this.publicKeyB64}) {
    publicKeyHash = CryptoUtils.hash(publicKeyB64);
  }
}
