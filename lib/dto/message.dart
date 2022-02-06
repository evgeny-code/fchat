library dto;

import 'package:flutter/foundation.dart';

import '../utils.dart';

class Message {
  String? idHash;
  MessageType? type;
  String? from;
  String? to;
  int? timeUTC;
  String content;

  Message.ofDB(
      {@required this.idHash,
      @required this.type,
      required this.content,
      @required this.from,
      @required this.to,
      this.timeUTC});

  Message.ofData(
      {@required this.type,
      required this.content,
      @required this.from,
      @required this.to,
      this.timeUTC}) {
    setIdHash();
  }

  void setIdHash() {
    String tmp = "";
    if (null != type) {
      tmp += type.toString();
    }

    if (null != from) {
      tmp += from.toString();
    }

    if (null != to) {
      tmp += to.toString();
    }

    if (null != timeUTC) {
      tmp += timeUTC.toString();
    }

    tmp += content;

    idHash = CryptoUtils.hash(tmp);
  }

  @override
  String toString() {
    return 'Message{idHash: $idHash, type: $type, from: $from, to: $to, timeUTC: $timeUTC, content: $content}';
  }
}

enum MessageType { text, html, imageB64, fileB64, imageURI, fileURI }

MessageType? resolveMessageType(String value) {
  for (MessageType type in MessageType.values) {
    if (type.toString() == value) {
      return type;
    }
  }

  return null;
}
