import 'package:flutter/material.dart';

import '../../screens/login/login_screen.dart';

class CustomDrawerHeader extends StatelessWidget {
  //const CustomDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pop();                                            //Fecha drawer quando logar
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => LoginScreen())
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
                children: const [
                  Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Clique Aqui',
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
