import 'package:mobx/mobx.dart';

part 'page_store.g.dart';

class PageStore = _PageStore with _$PageStore;

abstract class _PageStore with Store{

  //MOBX mais simples que podemos fazer
  //Comando para gerar o codido da store no terminal: flutter pub run build_runner watch
  //watch observa sempre que fazemos uma modificacao no codigo e gera um novo arquivo sempre que salvamos
  @observable
  int page = 0;

  /*
  Sera:
  Anuncio		      - page = 0
  Inserir Anuncio	- page = 1
  Favoritos		    - page = 2
  Minha conta		  - page = 3
   */

  @action
  void setPage(int value) => page = value;

}