// Banco de dados onde as informações sao armazenadas em linha e coluna
// precisa abrir e fechar o database
import 'package:calculadora_imc_2/models/register.model.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;

class SQLiteDataBase {
  // Nome da tabela e nome das colunas
  static const String table = 'usersInfos';
  static const String columnId = 'id';
  static const String columnName = 'name';
  static const String columnAltura = 'altura';
  static const String columnPeso = 'peso';
  static const String columnImc = 'imc';
  static const String columnCategory = 'category';

  Database? db;

  Future<Database?> obterDataBase() async {
    return db ?? await iniciarBancodeDadosSqlite();
  }

  Map<int, String> scripts = {
    1: '''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnName TEXT NOT NULL,
            $columnAltura REAL NOT NULL,
            $columnPeso REAL NOT NULL,
            $columnImc REAL NOT NULL,
            $columnCategory TEXT NOT NULL
          )
        '''
  };

  Future<Database?> iniciarBancodeDadosSqlite() async {
    db = await openDatabase(
      path.join(await getDatabasesPath(), 'database.db'),
      version: 1,
      onCreate: (Database db, int index) async {
        for (var i = 1; i <= scripts.length; i++) {
          await db.execute(scripts[i]!);
        }
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        for (var i = oldVersion + 1; i <= scripts.length; i++) {
          await db.execute(scripts[i]!);
        }
      },
    );
    return db;
  }

  static Future<List<RegisterModel>> obterDados() async {
    List<RegisterModel> registros = [];
    var db = await SQLiteDataBase()
        .iniciarBancodeDadosSqlite(); // Use a função correta para obter o banco de dados.
    var result = await db!.rawQuery(
        'SELECT id, name, altura, peso, imc, category FROM $table'); // Inclua 'id' na consulta.
    for (var element in result) {
      registros.add(RegisterModel(
        id: int.parse(element["id"].toString()),
        name: element["name"].toString(),
        altura: double.parse(element["altura"].toString()),
        peso: double.parse(element["peso"].toString()),
        imc: double.parse(element["imc"].toString()),
        category: element["category"].toString(),
      ));
    }
    return registros;
  }

  static Future<void> salvar(RegisterModel registerModel) async {
    var db = await SQLiteDataBase().obterDataBase();
    await db!.rawInsert(
        'INSERT INTO $table (name, altura, peso, imc, category) values (?, ?, ?, ?, ?)',
        [
          registerModel.name,
          registerModel.altura,
          registerModel.peso,
          registerModel.imc,
          registerModel.category
        ]);
  }

  // Future<void> update(Pessoa pessoa) async {
  //   var db = await SQLiteDataBase().obterDataBase();
  //   await db.rawInsert(
  //       'UPDATE usersInfos SET name = ?, altura = ?, peso = ?, WHERE id = ?) values (?,?)',
  //       [pessoa.nome, pessoa.altura, pessoa.peso, pessoa.id]);
  // }

  // Future<void> delete(int idPessoa) async {
  //   var db = await SQLiteDataBase().obterDataBase();
  //   await db.rawInsert(
  //       'DELETE FROM usersInfos WHERE id = ?) values (?,?)', [idPessoa]);
  // }
}
