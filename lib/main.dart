import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:help/screens/base/base_screen.dart';
import 'package:help/stores/page_store.dart';
import 'package:help/stores/user_manager_store.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  setupLocators();
  runApp(const MyApp());
}

//GetIt serviceLocator, utilizo ele para localizar servicos do meu App
void setupLocators(){
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(UserManagerStore());
}

Future<void> initializeParse() async{
  await Parse().initialize(
      'F3sayY5l2JpZWJaL5OeU1v96Rc1618P1Da6Igf9N',                               // App ID
      'https://parseapi.back4app.com/',                                         //serverURL
      clientKey: 'Uka7ZzCbB9IWWg6Yd8O8mvyf35nY4PGmrukox8ty',                    //clientKey
      autoSendSessionId: true,                                                  //Envia requisicoes ao parse
      debug: true                                                               //Mostra o debug direto no console
  );
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hE!p',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        //primaryColor: Colors.yellow,                                            //Rever porque nao muda a cor para amarelo
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.yellow,                                 //Seta a cor do background
        appBarTheme: AppBarTheme(
          elevation: 0                                                          //Seta a sombra
        ),
        cursorColor: Colors.black                                               //Cursor nao fica preto
      ),
      home: BaseScreen(),
    );
  }
}