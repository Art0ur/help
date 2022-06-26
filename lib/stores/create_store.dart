import 'package:get_it/get_it.dart';
import 'package:help/models/ad.dart';
import 'package:help/models/category.dart';
import 'package:help/repositories/ad_repository.dart';
import 'package:help/stores/user_manager_store.dart';
import 'package:mobx/mobx.dart';

part 'create_store.g.dart';

class CreateStore = _CreateStore with _$CreateStore;

abstract class _CreateStore with Store {
  ObservableList images = ObservableList();

  @computed
  bool get imagesValid => images.isNotEmpty;
  String get imagesError {
    if (!showErrors || imagesValid) {
      return '';
    } else {
      return 'Insira imagens';
    }
  }

  @observable
  String title = '';

  @action
  void setTitle(String value) => title = value;

  @computed
  bool get titleValid => title.length > 6;

  @computed
  String? get titleError {
    //if (title == null || titleValid) {
    if (!showErrors || titleValid) {
      return null;
    } else if (title.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Título muito curto';
    }
  }

  @observable
  String description = '';

  @action
  void setDescription(String value) => description = value;

  @computed
  bool get descriptionValid => description.length >= 10;
  String? get descriptionError {
    if (!showErrors || descriptionValid)
      return null;
    else if (description.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Descrição muito curta';
  }

/*
  if (name == null || nameValid) //Verificacao OK
  return null;
  else if (name.isEmpty) //Se vazio
  return 'Campo Obrigatorio';
  else
  return 'Nome muito curto';
*/

  @observable
  String priceText = '';

  @action
  void setPrice(String value) => priceText = value;

  @computed
  num? get price {
    if (priceText.contains(',')) {
      return num.tryParse(priceText.replaceAll(RegExp('[^0-9]'), ''))! / 100;
    } else {
      return num.tryParse(priceText);
    }
  }

  bool get priceValid => price != null && price! < 9999999;
  String? get priceError {
    if (!showErrors || priceValid)
      return null;
    else if (priceText.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Preço inválido';
  }

  @observable
  Category? category;

  @action
  void setCategory(Category value) => category = value;

  @observable
  bool hidePhone = true;

  @action
  void setHidePhone(bool? value) => hidePhone = value!;

  @computed
  bool get formValid =>
      imagesValid && titleValid && descriptionValid && priceValid;

  @computed
  Function() get sendPressed => formValid ? _send : _send;
  //Function() get signUpPressed => (isFormValid && !loading) ? _signUp : _signUp;

  @observable
  bool showErrors = false;

  @action
  void invalidSendPressed() => showErrors = true;
/*
  @observable
  bool loading = false;

  @observable
  String showErrors = false;

  @observable
  bool savedAd = false;
*/
  @action
  void _send() {
    final ad = Ad();

    ad.title = title;
    ad.description = description;
    ad.price = price!;
    ad.hidePhone = hidePhone;
    ad.images = images;
    ad.user = GetIt.I<UserManagerStore>().user!;

    AdRepository().save(ad);
  }
}
