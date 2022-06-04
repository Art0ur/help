import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:help/stores/page_store.dart';
import 'package:help/stores/user_manager_store.dart';

import '../../screens/login/login_screen.dart';

class CustomDrawerHeader extends StatelessWidget {
  //const CustomDrawerHeader({Key? key}) : super(key: key);

  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pop();
        if (userManagerStore.isLoggedIn){
          GetIt.I<PageStore>().setPage(4);
        } else
          //Fecha drawer quando logar
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => LoginScreen())
        );
      },
      child: Container(
        color: Colors.yellow,                                                      //mudar para amarelo depois
        height: 75,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            const Icon(Icons.person, color: Colors.white, size: 30,),
            const SizedBox(width: 20,),                                           //Espacamento entre icon e column
            Expanded(                                                             //Caso aja overflow
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,                     //alinha tudo na esquerda
                mainAxisAlignment: MainAxisAlignment.center,                      //alinha tudo no centro
                children: [
                  Text(
                    userManagerStore.isLoggedIn
                        ? userManagerStore.user!.name
                        : 'Login',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    userManagerStore.isLoggedIn
                    ? userManagerStore.user!.email
                    : 'Clique Aqui',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
