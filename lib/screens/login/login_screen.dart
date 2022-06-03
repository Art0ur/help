import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:help/stores/login_store.dart';
import '../signup/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  //const LoginScreen({Key? key}) : super(key: key);

  final LoginStore loginStore = LoginStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrar'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        //Corrigir o bug da tela
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Acessar com E-mail:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[900],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 3, bottom: 4, top: 8),
                    child: Text(
                      'Email',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Observer(builder: (_){
                    return TextField(
                      enabled: !loginStore.loading,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        isDense: true,
                        errorText: loginStore.emailError,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: loginStore.setEmail,
                    );
                  }),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 3, bottom: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Senha',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        GestureDetector(
                            child: Text(
                              'Esqueceu sua senha?',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.grey[800],
                              ),
                            ),
                            onTap: () {})
                      ],
                    ),
                  ),
                  Observer(builder:(_){
                    return TextField(enabled: !loginStore.loading,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        isDense: true,
                        errorText: loginStore.passwordError,
                      ),
                      obscureText: true,
                      onChanged: loginStore.setPassword,
                    );
                  }),
                  Observer(builder: (_){
                    return Container(
                      height: 40,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: RaisedButton(
                        color: Colors.black,
                        disabledColor: Colors.black.withAlpha(120),
                        child: loginStore.loading
                          ? CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        )
                          : Text('Entrar'),
                        textColor: Colors.yellow,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: loginStore.loginPressed,
                      ),
                    );
                  }),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: <Widget>[
                        const Text('Não tem uma conta?',
                            style: TextStyle(fontSize: 16)), // Text
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => SignUpScreen()));
                          }, // Material
                          child: Text(
                            ' Cadastre-se',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.purple,
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
    );
  }
}
