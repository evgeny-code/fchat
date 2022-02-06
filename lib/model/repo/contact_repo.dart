library model;

import 'package:fchat/dto/contact.dart';


class ContactRepo {
  static final ContactRepo _singleton = ContactRepo._internal();

  factory ContactRepo() {
    return _singleton;
  }

  ContactRepo._internal();


  List<Contact> getContacts() {
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