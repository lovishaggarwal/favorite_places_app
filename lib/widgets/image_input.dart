import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.onImageSelected});

  final void Function(File pickedImage) onImageSelected;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? selectedImage;
  String? imageSource = 'camera';

  takePicture() async {
    print('Take Picture');
    final imagePicker = ImagePicker();
    final cameraImage = await imagePicker.pickImage(
        source:
            imageSource == 'camera' ? ImageSource.camera : ImageSource.gallery,
        maxWidth: 600);

    if (cameraImage == null) {
      return;
    }
    print(cameraImage.name);
    setState(() {
      selectedImage = File(cameraImage.path);
    });

    widget.onImageSelected(selectedImage!);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border:
            Border.all(width: 1, color: Theme.of(context).colorScheme.primary),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 250,
      width: double.infinity,
      alignment: Alignment.center,
      child: selectedImage == null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: () {
                    imageSource = 'camera';
                    takePicture();
                  },
                  label: Text('Take Picture'),
                  icon: Icon(Icons.camera),
                ),
                SizedBox(width: 10),
                TextButton.icon(
                  onPressed: () {
                    imageSource = 'gallery';
                    takePicture();
                  },
                  label: Text('Pick Image'),
                  icon: Icon(Icons.image),
                ),
              ],
            )
          : GestureDetector(
            onTap: takePicture,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.file(
                selectedImage!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
    );
  }
}
