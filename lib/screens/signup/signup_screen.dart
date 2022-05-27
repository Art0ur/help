import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:help/screens/signup/components/field_title.dart';
import 'package:flutter/services.dart';
import 'package:help/stores/signup_store.dart';
import 'package:mobx/mobx.dart';

class SignUpScreen extends StatelessWidget {
  //const SignUpScreen({Key? key}) : super(key: key);

  //static final TextInputFormatter digitsOnly = FilteringTextInputFormatter.allow(RegExp(r'[0-9]'));
  final SignupStore signupStore = SignupStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        centerTitle: true,
      ), // AppBar
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(16)), // RoundedRectangleBorder
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FieldTitle(
                      title: 'Apelido',
                      subtitle: 'Como aparecera em seus anuncios',
                    ),
                    Observer(builder: (_){
                      return TextField(
                        enabled: !signupStore.loading,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Exemplo: Tuzim das mina',
                            isDense: true,
                            errorText:  signupStore.nameError
                        ),
                        onChanged: signupStore.setName,
                      );
                    }),
                    SizedBox(
                      height: 16,
                    ),
                    FieldTitle(
                      title: 'E-mail',
                      subtitle: 'Enviaremos um e-mail de confirmacao',
                    ),
                    Observer (builder: (_){
                      return TextField(
                        enabled: !signupStore.loading,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Exemplo: TuzimDasMina@gmail.com',
                            isDense: true,
                            errorText:  signupStore.emailError
                        ),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        onChanged: signupStore.setEmail,
                      );
                    }),
                    SizedBox(
                      height: 16,
                    ),
                    FieldTitle(
                      title: 'Celular',
                      subtitle: 'Proteja sua conta',
                    ),
                    Observer (builder: (_){
                      return TextField(
                        enabled: !signupStore.loading,
                        decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: '(99) 9 9999-9999',
                              isDense: true,
                              errorText: signupStore.phoneError
                          ),
                          keyboardType: TextInputType.phone,
                          /*inputFormatters: [
                        TelefoneInputFormatter()
                        FilteringTextInputFormatter.digitsOnly
                      ],*/
                          onChanged: signupStore.setPhone,
                        );
                    }),
                    SizedBox(
                      height: 16,
                    ),
                    FieldTitle(
                      title: 'Senha',
                      subtitle: 'Use letras, numeros e caacteres especiais',
                    ),
                    Observer(builder: (_){
                      return TextField(
                        enabled: !signupStore.loading,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                            errorText: signupStore.pass1Error
                        ),
                        obscureText: true,
                        onChanged: signupStore.setPass1,
                      );
                    }),
                    SizedBox(
                      height: 16,
                    ),
                    FieldTitle(
                      title: 'Confirmar a senha',
                      subtitle: 'Repita a senha',
                    ),
                    Observer(builder: (_){
                      return TextField(
                        enabled: !signupStore.loading,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                            errorText: signupStore.pass2Error
                        ),
                        obscureText: true,
                        onChanged: signupStore.setPass2,
                      );
                    }),
                    SizedBox(
                      height: 16,
                    ),
                    Observer(builder: (_){
                      return Container(                                                      //Apresentando erros com constantes
                        height: 40,
                        margin: const EdgeInsets.only(top: 20, bottom: 12),
                        child: RaisedButton(
                          color: Colors.black,
                          disabledColor: Colors.red.withAlpha(120),
                          child: signupStore.loading
                              ? CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.yellow),
                          )
                              : Text('Cadastrar'),
                          textColor: Colors.yellow,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          onPressed: null,// signupStore.signUpPressed,
                          //onPressed: signupStore.signUpPressed,
                        ),
                      );
                    }),
                    Divider(
                      color: Colors.black,
                    ),
                    Padding(                                                        //Apresentando erros com constantes
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Já tem uma conta?',
                              style: TextStyle(fontSize: 16),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Entrar',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            )
                          ],
                        ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
