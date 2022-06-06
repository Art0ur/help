import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceModal extends StatelessWidget {
  ImageSourceModal(this.onImageSelected);

  final Function(File) onImageSelected;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FlatButton(
            onPressed: getFromCamera,
            child: const Text('Camera'),
          ),
          FlatButton(
            onPressed: getFromGallery,
            child: const Text('Galeria'),
          ),
        ],
      ),
    );
  }

  Future<void> getFromCamera() async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    if (pickedFile == null) return;
    imageSelected(File(pickedFile.path));
  }

  Future<void> getFromGallery() async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile == null) return;
    imageSelected(File(pickedFile.path));
  }

  Future<void> imageSelected(File image) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: image.path,
      aspectRatio: CropAspectRatio(
        ratioX: 1,
        ratioY: 1,
      ),
      uiSettings: UiSettings(
          toolbarTitle: 'Editar Imagem',
          toolbarColor: Colors.yellow,
          toolbarWidgetColor: Colors.black),
    );
    //if (croppedFile == null) return;
    //onImageSelected(croppedFile); //rever porque nao ta funcionando
  }
}

UiSettings(
    {required String toolbarTitle,
    required MaterialColor toolbarColor,
    required Color toolbarWidgetColor}) {}
