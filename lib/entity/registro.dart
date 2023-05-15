import 'package:intl/intl.dart';

class Registro{

  static const nomeTabela = 'registros';
  static const campoId = 'id';
  static const campoLocalizacao = 'localizacao';
  static const campoDataHora = 'horario';


  int? id;
  DateTime? dataRegistro= DateTime.now();
  String localizacao;


  Registro({ required this.id, required this.localizacao, this.dataRegistro});

  String get dataCadastroFormatado{
    DateTime? reg = dataRegistro;
    String formattedDate = DateFormat('dd/MM/yyyy HH:mm').format(reg!);
    return formattedDate;
  }



  Map<String, dynamic> toMap() => {
    //campoId: id == 0 ? null: id,
    campoLocalizacao: localizacao,
    campoDataHora:
    dataRegistro == null ? null : DateFormat("dd/MM/yyyy HH:mm:ss").format(dataRegistro!)
  };

  factory Registro.fromMap(Map<String, dynamic> map) => Registro(
    id: map[campoId] is int ? map[campoId] : null,
    localizacao: map[campoLocalizacao] is String ? map[campoLocalizacao] : '',
    dataRegistro: map[campoDataHora] is String ? DateFormat("dd/MM/yyyy HH:mm:ss").parse(map[campoDataHora])
        : null,
  );






}