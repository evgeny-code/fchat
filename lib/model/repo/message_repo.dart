library model;

import 'dart:developer';

import 'package:fchat/dto/message.dart';
import 'package:fchat/model/db/db_provider.dart';

class MessageRepo {
  static final MessageRepo _singleton = MessageRepo._internal();

  factory MessageRepo() {
    return _singleton;
  }

  MessageRepo._internal();

  static const String me = "dhdfdf7238328dfjdsjn";
  static const String human = "aldfkdf92kdmr93ssee22";

  Future<List<Message>> getMessages(String myHash, String userHash) async {
    var db = (await DBProvider.db.database)!;
    List<Map> list = await db.rawQuery(
        'SELECT * FROM messages '
            'where (from_u = "$myHash" and  to_u = "$userHash") '
            'or (from_u = "$userHash" and to_u = "$myHash") '
            'order by timeUTC;');

    List<Message> result = [];
    for (Map row in list) {
      result.add(Message.ofDB(
          idHash: row['idHash'],
          type: resolveMessageType(row['type']),
          content: row['content'],
          timeUTC: row['timeUTC'],
          from: row['from_u'],
          to: row['to_u']));
    }


    log("getMessages result: " + result.toString());

    return result;
  }

  Future<void> addMessage(Message message) async {
    var db = (await DBProvider.db.database)!;

    await db.transaction((txn) async {
      var i = await txn.rawInsert(
          'INSERT INTO messages(idHash, type, timeUTC, from_u, to_u, content) VALUES(?, ?, ?, ?, ?, ?)',
          [message.idHash, message.type!.toString(), message.timeUTC, message.from, message.to, message.content]);
      log("rawInsert=" + i.toString());
    });
  }

  List<Message> getTestMessages() => [
      Message.ofData(
          type: MessageType.text,
          content: 'qweqeqe',
          from: me,
          to: human,
          timeUTC: DateTime.now().microsecondsSinceEpoch),
      Message.ofData(
          type: MessageType.text,
          content: 'dfgdfg',
          from: human,
          to: me,
          timeUTC: DateTime.now().microsecondsSinceEpoch),
      Message.ofData(
          type: MessageType.text,
          content: ' bnvcnbfdgd',
          from: me,
          to: human,
          timeUTC: DateTime.now().microsecondsSinceEpoch),
      Message.ofData(
          type: MessageType.text,
          content: '34ffe34rf',
          from: human,
          to: me,
          timeUTC: DateTime.now().microsecondsSinceEpoch),
      Message.ofData(
          type: MessageType.text,
          content: 'bbdfgdefg',
          from: me,
          to: human,
          timeUTC: DateTime.now().microsecondsSinceEpoch),
    ];
}
