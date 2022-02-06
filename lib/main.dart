import 'package:fchat/model/db/db_provider.dart';
import 'package:fchat/view/chat_app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var db = (await DBProvider.db.database)!;
  List<Map> list = await db.rawQuery("select * from settings");
  print('items: $list');

  runApp(const ChatApp());
}
