import 'package:get_it/get_it.dart';
import 'package:help/helpers/extensions.dart';
import 'package:help/repositories/user_repository.dart';
import 'package:help/stores/user_manager_store.dart';
import 'package:mobx/mobx.dart';

import '../models/user.dart';

part 'signup_store.g.dart';

class SignupStore = _SignupStore with _$SignupStore;

abstract class _SignupStore with Store {
  //Todos sao chamado em signup_store
  //Verificacao nome digitado
  @observable
  String name = "";

  //Deixei pra nao apresentar erros e validar os outros campos
  //get teste => null;

  @action
  void setName(String value) => name = value;

  //https://docs.flutter.dev/cookbook/forms/validation
  @computed
  bool get nameValid => name != null && name.length > 6;

  @computed
  String? get nameError {
    if (name == null || nameValid) //Verificacao OK
      return null;
    else if (name.isEmpty) //Se vazio
      return 'Campo Obrigatorio';
    else
      return 'Nome muito curto';

    //Deixei pra nao apresentar erros e validar os outros campos
    //validator: (value){
    /*if (teste == null){
      return 'Digite um texto';
      }
    else if(teste.isEmpty) {
      return 'Campo Obrigatorio';
    } else {
      return null;
    }*/
  }

  //Verificacao email. Regex em Helpers > extensions.dart
  @observable
  String email = "";

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email.isEmailValid();

  String? get emailError {
    if (email == null || emailValid) {
      return null;
    } else if (email.isEmpty) {
      return 'Campo Obrigatorio';
    } else {
      return 'E-mail invalido';
    }
  }

  //Verificacao telefone
  @observable
  String phone = "";

  @action
  void setPhone(String value) => phone = value;

  @computed
  bool get phoneValid => phone != null && phone.length >= 14;

  String? get phoneError {
    if (phone == null || phoneValid) {
      return null;
    } else if (phone.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Celular inválido';
    }
  }

  //Verificacao Senha
  @observable
  String pass1 = "";

  @action
  void setPass1(String value) => pass1 = value;

  @computed
  bool get pass1Valid => pass1 != null && pass1.length > 6;

  String? get pass1Error {
    if (pass1 == null || pass1Valid) {
      return null;
    } else if (pass1.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Senha muito curta';
    }
  }

  //Verificacao se a senha confere
  @observable
  String pass2 = "";

  @action
  void setPass2(String value) => pass2 = value;

  bool get pass2Valid => pass2 != null && pass2 == pass1;

  String? get pass2Error {
    if (pass2 == null || pass2Valid) {
      return null;
    } else {
      return 'Senhas nao coincidem';
    }
  }

  @computed
  bool get isFormValid =>
      nameValid && emailValid && phoneValid && pass1Valid && pass2Valid;

  @computed
  //Function get signUpPressed => (isFormValid && !loading) ? _signUp : null;
  //Future<void> Function() get signUpPressed => (isFormValid && !loading) ? _signUp : _signUp;
  Function() get signUpPressed => (isFormValid && !loading) ? _signUp : _signUp;

  @observable
  bool _loading = false;

  @observable
  String error = "";

  @computed
  bool get loading => _loading;

  @action
  Future<void> _signUp() async {
    _loading = true;

    final user = User(
      name: name,
      email: email,
      phone: phone,
      password: pass1,
    );

    try {
      final resultUser = await UserRepository().signUp(user);
      //print(resultUser);
      GetIt.I<UserManagerStore>().setUser(resultUser);
    } catch (e) {
      error = (e as String?)!;
    }
    //await Future.delayed(const Duration(seconds: 2));

    _loading = (false);
  }
}
