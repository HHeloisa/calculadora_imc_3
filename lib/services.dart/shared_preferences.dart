// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

// https://pub.dev/packages/shared_preferences/
/// Para usar o shared preferecenses é preciso instalar o pacote
/// flutter pub add shared_preferences
///     Exemplos de uso:
///     await SharedPreferencesService.handleSharedPreferences(PreferencesKeys.NAME,PreferencesUpdateEnum.SET,PreferencesType.BOOL,true);
///     await SharedPreferencesService.handleSharedPreferences(PreferencesKeys.NAME,PreferencesUpdateEnum.GET,PreferencesType.BOOL,null);

class SharedPreferencesService {
  /// Função criada para lidar com o sharedPreferences
  static Future<dynamic> handleSharedPreferences(
      PreferencesKeysEnum keyName,
      PreferencesUpdateEnum update,
      PreferencesTypeEnum type,
      dynamic value) async {
    String keyNameString = keyName.toString();
    final storage = await SharedPreferences.getInstance();

    if (update == PreferencesUpdateEnum.GET) {
      var result = _getPreferences(storage, keyNameString, type);
      return result;
    }

    switch (update) {
      case PreferencesUpdateEnum.REMOVE:
        await _removePreference(storage, keyNameString);
        break;
      case PreferencesUpdateEnum.SET:
        await _setPreferences(storage, keyNameString, type, value);
        break;

      default:
    }
  }
}

_removePreference(SharedPreferences storage, String keyName) async {
  await storage.remove(keyName);
}

/// A partir dos parametros recebidos executa a
_setPreferences(SharedPreferences storage, String keyName,
    PreferencesTypeEnum type, dynamic value) async {
  switch (type) {
    case PreferencesTypeEnum.BOOL:
      await storage.setBool(keyName, value);
      break;
    case PreferencesTypeEnum.INT:
      await storage.setInt(keyName, value);
      break;
    case PreferencesTypeEnum.STRING:
      await storage.setString(keyName, value);
      break;
    case PreferencesTypeEnum.STRINGLIST:
      await storage.setStringList(keyName, value);
      break;
    case PreferencesTypeEnum.DOUBLE:
      await storage.setDouble(keyName, value);
      break;
    default:
  }
}

_getPreferences(
    SharedPreferences storage, String keyName, PreferencesTypeEnum type) {
  switch (type) {
    case PreferencesTypeEnum.BOOL:
      return storage.getBool(keyName);

    case PreferencesTypeEnum.INT:
      return storage.getInt(keyName);
    case PreferencesTypeEnum.STRING:
      return storage.getString(keyName);

    case PreferencesTypeEnum.STRINGLIST:
      return storage.getStringList(keyName);

    case PreferencesTypeEnum.DOUBLE:
      return storage.getDouble(keyName);

    default:
      null;
  }
}

enum PreferencesUpdateEnum { GET, SET, REMOVE }

enum PreferencesTypeEnum { STRING, INT, BOOL, DOUBLE, STRINGLIST }

enum PreferencesKeysEnum { NAME, STRING, INT, BOOL, DOUBLE, STRINGLIST }
