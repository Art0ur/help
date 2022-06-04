import 'package:help/repositories/user_repository.dart';
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
  String? get passwordError => passwordValid ? null : 'Senha invalida';

  //Function() get signUpPressed => (isFormValid && !loading) ? _signUp : _signUp;
  @computed
  //Function() get loginPressed => (emailValid && passwordValid) ? (){} : null;
  Function() get loginPressed => (emailValid && passwordValid && !loading) ? _login : _login;

  @observable
  bool loading = false;

  @observable
  String error = '';

  @action
  Future<void> _login()  async {
    loading = true;

    try {
      final user = await UserRepository().loginWithEmail(email, password);
      print(user);
    } catch(e){
      error = (e as String?)!;      //Rever
    }
    loading = false;

  }

}