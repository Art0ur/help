import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:help/screens/signup/components/field_title.dart';
import 'package:flutter/services.dart';

class SignUpScreen extends StatelessWidget {
  //const SignUpScreen({Key? key}) : super(key: key);

  //static final TextInputFormatter digitsOnly = FilteringTextInputFormatter.allow(RegExp(r'[0-9]'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        centerTitle: true,
      ), // AppBar
      body: Container(
        alignment: Alignment.center,
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
              children: const [
                FieldTitle(
                  title: 'Apelido',
                  subtitle: 'Como aparecera em seus anuncios',
                ),
                TextField(
                    decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Exemplo: Tuzim das mina',
                  isDense: true,
                )),
                SizedBox(
                  height: 16,
                ),
                FieldTitle(
                  title: 'E-mail',
                  subtitle: 'Enviaremos um e-mail de confirmacao',
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Exemplo: TuzimDasMina@gmail.com',
                    isDense: true,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                ),
                SizedBox(
                  height: 16,
                ),
                FieldTitle(
                  title: 'Celular',
                  subtitle: 'Proteja sua conta',
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '(99) 9 9999-9999',
                    isDense: true,
                  ),
                  keyboardType: TextInputType.phone,
                  /*inputFormatters: [
                    TelefoneInputFormatter()
                    FilteringTextInputFormatter.digitsOnly
                  ],*/
                ),
                SizedBox(
                  height: 16,
                ),
                FieldTitle(
                  title: 'Senha',
                  subtitle: 'Use letras, numeros e caacteres especiais',
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                  obscureText: true,
                ),
                SizedBox(
                  height: 16,
                ),
                FieldTitle(
                  title: 'Confirmar a senha',
                  subtitle: 'Repita a senha',
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                  obscureText: true,
                ),
                SizedBox(
                  height: 16,
                ),
                Container(                                                      //Apresentando erros com constantes
                  height: 40,
                  margin: const EdgeInsets.only(top: 20, bottom: 12),
                  child: RaisedButton(
                    color: Colors.yellow,
                    child: Text('Cadastrar'),
                      textColor: Colors.black,
                      elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    onPressed: () {},
                  ),
                ),
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
    );
  }
}
