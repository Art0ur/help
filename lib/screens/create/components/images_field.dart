import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:help/screens/create/components/image_source_modal.dart';
import 'package:help/stores/create_store.dart';

class ImagesField extends StatelessWidget {
  ImagesField(this.createStore);

  final CreateStore createStore;

  @override
  Widget build(BuildContext context) {
    void onImageSelected(File image) {
      createStore.images.add(image);
      Navigator.of(context).pop(); //Rever dialogo nao some
    }

    return Container(
      color: Colors.grey[200],
      height: 120,
      child: Observer(
        builder: (_) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: createStore.images.length + 1,
            itemBuilder: (_, index) {
              if (index == createStore.images.length)
                return Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                  child: GestureDetector(
                    //mapear botao
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (_) => ImageSourceModal(onImageSelected),
                      );
                    },
                    child: CircleAvatar(
                      radius: 44,
                      backgroundColor: Colors.grey[400],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera_alt,
                            size: 40,
                            color: Colors.white,
                          ),
                          /*Text(
                      '+',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ), */
                        ],
                      ),
                    ),
                  ),
                );
              else {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                  child: GestureDetector(
                    //mapear botao
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 44,
                      backgroundImage: //FileImage(
                          createStore.images[index],
                    ),
                  ),
                  //),
                );
              }
            },
          );
        },
      ),
    );
  }
}
