import 'package:mobx/mobx.dart';
import 'package:help/helpers/extensions.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {

  @observable
  String email = '';

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email.isEmailValid();

  String? get emailError => emailValid ? null : 'Email invalido';

  @observable
  String password = '';

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get passwordValid => password != null && password.length >= 4;
  String? get passwordError => passwordValid ? null : 'Senhaa invalida';

  //Function() get signUpPressed => (isFormValid && !loading) ? _signUp : _signUp;
  @computed
  //Function() get loginPressed => (emailValid && passwordValid) ? (){} : null;
  Function() get loginPressed => (emailValid && passwordValid && !loading) ? _login : _login;

  @observable
  bool loading = false;

  @action
  Future<void> _login()  async {
    loading = true;

    await Future.delayed(const Duration(seconds: 2));

    loading = false;

  }

}