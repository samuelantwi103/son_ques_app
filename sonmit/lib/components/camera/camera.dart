import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerComponent extends StatefulWidget {
  final Function(List<File>) onImagesPicked;

  const ImagePickerComponent({super.key, required this.onImagesPicked});

  @override
  State<ImagePickerComponent> createState() => _ImagePickerComponentState();
}

class _ImagePickerComponentState extends State<ImagePickerComponent> {
  final ImagePicker _picker = ImagePicker();
  List<File> _pickedImages = [];

  Future<void> pickImages() async {
    debugPrint("pickImages() called"); // Debugging line
    try {
      if (Platform.isAndroid || Platform.isIOS) {
        debugPrint("Platform is Android or iOS"); // Debugging line
        final pickedFiles = await _picker.pickMultiImage();
        if (pickedFiles != null) {
          debugPrint("Files picked: ${pickedFiles.length}"); // Debugging line
          setState(() {
            _pickedImages = pickedFiles.map((e) => File(e.path)).toList();
          });
          widget.onImagesPicked(_pickedImages);
        } else {
          debugPrint("No files picked"); // Debugging line
        }
      } else if (Platform.isWindows) {
        debugPrint("Platform is Windows"); // Debugging line
        // Handle Windows-specific picker logic
        final pickedFiles = await _picker.pickMultiImage();
        if (pickedFiles != null) {
          setState(() {
            _pickedImages = pickedFiles.map((e) => File(e.path)).toList();
          });
          widget.onImagesPicked(_pickedImages);
        }
      } else {
        debugPrint("Unsupported platform"); // Debugging line
      }
      setState(() {});
    } catch (e) {
      debugPrint("Error picking images: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: pickImages,
          child: const Text("Pick Images"),
        ),
        if (_pickedImages.isNotEmpty)
          Wrap(
            spacing: 8.0,
            children: _pickedImages.map((image) {
              setState(() {});
              return Image.file(image,
                  width: 80, height: 80, fit: BoxFit.cover);
            }).toList(),
          ),
      ],
    );
  }
}
