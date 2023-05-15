import '../database/provider.dart';
import '../entity/registro.dart';

class RegistroDao {
  final databaseProvider = DatabaseProvider.instance;

  Future<bool> salvar(Registro ponto) async {
    final database = await databaseProvider.database;
    final valores = ponto.toMap();
    if (ponto.id == 0 || ponto.id == null) {
      ponto.id = await database.insert(Registro.nomeTabela, valores);
      return true;
    } else {
      final registrosAtualizados = await database.update(
        Registro.nomeTabela,
        valores,
        where: '${Registro.campoId} = ?',
        whereArgs: [ponto.id],
      );
      return registrosAtualizados > 0;
    }
  }


  Future<List<Registro>> getLista() async {
    final database = await databaseProvider.database;
    final resultado = await database.query(
      Registro.nomeTabela,
      columns: [
        Registro.campoId,
        Registro.campoLocalizacao,
        Registro.campoDataHora,
      ],

    );
    return resultado.map((m) => Registro.fromMap(m)).toList();
  }


}