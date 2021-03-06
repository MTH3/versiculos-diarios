import 'package:get/get.dart';
import 'package:todo_dia/app/model/palavra.dart';
import 'package:todo_dia/app/model/versiculo.dart';
import 'package:todo_dia/app/repository/harura_settings.dart';
import 'package:todo_dia/app/repository/queries/palavra_queries.dart';
import 'package:todo_dia/app/repository/queries/versiculo_queries.dart';

class VersiculoRepository {
  final hasuraSettings = Get.find<HasuraSettings>();

  static VersiculoRepository get to => Get.find();

  Future<List<Versiculo>> getVersiculosPaginados() async {
    var query = VersiculoQueries.LISTA_PAGINADA;
    var snapshot = await hasuraSettings.connect.query(query);
    //print(snapshot);
    return snapshot['data']['versiculos']
        .map<Versiculo>((versiculos) => Versiculo.fromMap(versiculos))
        .toList();
  }

  Future<List<Palavra>> getPalavraPaginados() async {
    var query = PalavraQueries.PALAVRA_LISTA_PAGINADA;
    var snapshot = await hasuraSettings.connect.query(query);
    //print(snapshot);
    return snapshot['data']['palavras']
        .map<Palavra>((palavras) => Palavra.fromMap(palavras))
        .toList();
  }
}
