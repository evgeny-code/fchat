import 'dart:developer';

import 'package:fchat/dto/settings.dart';
import 'package:fchat/model/db/db_provider.dart';

class SettingsRepo {
  static const String KEY = "app_v1";
  static final SettingsRepo _singleton = SettingsRepo._internal();

  factory SettingsRepo() {
    return _singleton;
  }

  SettingsRepo._internal();

  Future<Settings> getSettings() async {
    var db = (await DBProvider.db.database)!;
    List<Map> list =
        await db.rawQuery('SELECT * FROM Settings where id = "$KEY";');
    Map single = list.single;
    return Settings(
        serverUrl: single['serverUrl'],
        privateKeyB64: single['privateKeyB64'],
        publicKeyB64: single['publicKeyB64']);
  }

  Future<void> saveSettings(Settings settings) async {
    var db = (await DBProvider.db.database)!;

    await db.transaction((txn) async {
      await txn.rawQuery(
          'INSERT OR REPLACE INTO settings(id, serverUrl, privateKeyB64, publicKeyB64) VALUES(?, ?, ?, ?)',
          [KEY, settings.serverUrl, settings.privateKeyB64, settings.publicKeyB64]);
    });
  }
}
