library model;

import 'dart:developer';

import 'package:fchat/dto/contact.dart';
import 'package:fchat/model/db/db_provider.dart';


class ContactRepo {
  static final ContactRepo _singleton = ContactRepo._internal();

  factory ContactRepo() {
    return _singleton;
  }

  ContactRepo._internal();

  Future<Contact> getContact(String keyHash) async {
    var db = (await DBProvider.db.database)!;
    List<Map> list = await db.rawQuery(
        'SELECT * FROM contacts WHERE keyHash = $keyHash ');

    for (Map row in list) {
      return Contact.ofDB(
          keyHash: row['keyHash'],
          publicKeyB64: row['publicKeyB64'],
          name: row['name']);
    }

    throw Exception("Contact not exist");
  }

  Future<List<Contact>> getContacts() async {
    var db = (await DBProvider.db.database)!;
    List<Map> list = await db.rawQuery(
        'SELECT * FROM contacts '
            'order by name;');

    List<Contact> result = [];
    for (Map row in list) {
      result.add(Contact.ofDB(
          keyHash: row['keyHash'],
          publicKeyB64: row['publicKeyB64'],
          name: row['name']));
    }


    log("getContacts result: " + result.toString());

    return result;
  }

  List<Contact> getContactsTest() {
    return [
      Contact(publicKeyB64: "wEN8aUU5ZvXcDqJoI0ieMdXv4a3B4dxOy8zT1zEYV9sQ1xZ53zSm4yHPeLYEcW1O", name: "UJIN"),
      Contact(publicKeyB64: "nmcSr2yBitIPxgiTGmNA9JQdofXHhwy1p15NoymKDJ4XWLRJRL2Fv257umMK49iY", name: "WEROX"),
      Contact(publicKeyB64: "jei4jhCiCh6Dp1HeKL5V0Tm7Cmy7lwzezCYE988a9JMvvgOzXRDeb3Yc077rtQew", name: "UTER"),
      Contact(publicKeyB64: "AmrRvU6MCWTvAP1PFPKp6xlE9pAsJytmdsGieK2QNsBEiJSpgzNNR06seDtjf7um", name: "IVAN"),
      Contact(publicKeyB64: "C2EOIfsx0wzaAoF2RDDtEd40F02cuLoHRVQ4i9estVGkun43OW2iZtWCj2tZ3qg8", name: "ADIC"),

      Contact(publicKeyB64: "wEN8aUU5ZvXcDqJoI0ieMdXv4a3B4dxOy8zT1zEYV9sQ1xZ53zSm4yHPeLYEcW1O", name: "UJIN"),
      Contact(publicKeyB64: "nmcSr2yBitIPxgiTGmNA9JQdofXHhwy1p15NoymKDJ4XWLRJRL2Fv257umMK49iY", name: "WEROX"),
      Contact(publicKeyB64: "jei4jhCiCh6Dp1HeKL5V0Tm7Cmy7lwzezCYE988a9JMvvgOzXRDeb3Yc077rtQew", name: "UTER"),
      Contact(publicKeyB64: "AmrRvU6MCWTvAP1PFPKp6xlE9pAsJytmdsGieK2QNsBEiJSpgzNNR06seDtjf7um", name: "IVAN"),
      Contact(publicKeyB64: "C2EOIfsx0wzaAoF2RDDtEd40F02cuLoHRVQ4i9estVGkun43OW2iZtWCj2tZ3qg8", name: "ADIC"),

      Contact(publicKeyB64: "wEN8aUU5ZvXcDqJoI0ieMdXv4a3B4dxOy8zT1zEYV9sQ1xZ53zSm4yHPeLYEcW1O", name: "UJIN"),
      Contact(publicKeyB64: "nmcSr2yBitIPxgiTGmNA9JQdofXHhwy1p15NoymKDJ4XWLRJRL2Fv257umMK49iY", name: "WEROX"),
      Contact(publicKeyB64: "jei4jhCiCh6Dp1HeKL5V0Tm7Cmy7lwzezCYE988a9JMvvgOzXRDeb3Yc077rtQew", name: "UTER"),
      Contact(publicKeyB64: "AmrRvU6MCWTvAP1PFPKp6xlE9pAsJytmdsGieK2QNsBEiJSpgzNNR06seDtjf7um", name: "IVAN"),
      Contact(publicKeyB64: "C2EOIfsx0wzaAoF2RDDtEd40F02cuLoHRVQ4i9estVGkun43OW2iZtWCj2tZ3qg8", name: "ADIC"),

      Contact(publicKeyB64: "wEN8aUU5ZvXcDqJoI0ieMdXv4a3B4dxOy8zT1zEYV9sQ1xZ53zSm4yHPeLYEcW1O", name: "UJIN"),
      Contact(publicKeyB64: "nmcSr2yBitIPxgiTGmNA9JQdofXHhwy1p15NoymKDJ4XWLRJRL2Fv257umMK49iY", name: "WEROX"),
      Contact(publicKeyB64: "jei4jhCiCh6Dp1HeKL5V0Tm7Cmy7lwzezCYE988a9JMvvgOzXRDeb3Yc077rtQew", name: "UTER"),
      Contact(publicKeyB64: "AmrRvU6MCWTvAP1PFPKp6xlE9pAsJytmdsGieK2QNsBEiJSpgzNNR06seDtjf7um", name: "IVAN"),
      Contact(publicKeyB64: "C2EOIfsx0wzaAoF2RDDtEd40F02cuLoHRVQ4i9estVGkun43OW2iZtWCj2tZ3qg8", name: "ADIC"),
    ];
  }
}