import 'package:crypt/crypt.dart';

class CryptoUtils {

  static String hash(String data) {
    return Crypt.sha256(data).hash;
  }

}