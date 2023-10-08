// ignore_for_file: constant_identifier_names

import 'package:hive/hive.dart';

// Para o hive é necessário adicionar:
// part 'file_name.model.g.dart';
//  que irá permanecer como errado até que rode o comando:
// flutter pub run build_runner build
// de forma a gerar o model automaticamente, com o hive

/// Extendo o model como um HiveObject para que posso ser um adapter
/// Crie um adapter para cada ID: @HiveType(typeId: 0)
/// e para cada propriedade:   @HiveField(0)
/// sempre que alterar algum adapter salvo (classe, model) precisa rodar novamente o o buildRunner

class HiveService {
  static Future<dynamic> handlePreferences(BoxNamesEnum boxName,
      HiveKeysEnum keyName, HiveUpdateEnum update, dynamic value) async {
    String boxNameString = boxName.toString();
    String keyNameString = keyName.toString();
    Box box = Hive.isBoxOpen(boxNameString)
        ? Hive.box(boxNameString)
        : await Hive.openBox(boxNameString);

    switch (update) {
      case HiveUpdateEnum.GET:
        return box.get(keyNameString);
      case HiveUpdateEnum.REMOVE:
        await box.delete(keyNameString);
        break;
      case HiveUpdateEnum.PUT:
        box.put(keyNameString, value);
        break;

      /// Após criado o model automatico, ele passa a ser um adapter
      case HiveUpdateEnum.ADAPTER:
        box.add(value);
        break;

      default:
    }
    return null;
  }
}

enum BoxNamesEnum { TESTE }

enum HiveUpdateEnum { GET, PUT, ADAPTER, REMOVE }

enum HiveKeysEnum { NAME, STRING, INT, BOOL, DOUBLE, STRINGLIST }
