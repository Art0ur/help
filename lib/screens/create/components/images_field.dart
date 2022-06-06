import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help/screens/create/components/image_source_modal.dart';

class ImagesField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
            child: GestureDetector(
              //mapear botao
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (_) => ImageSourceModal(),
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
        },
      ),
    );
  }
}
