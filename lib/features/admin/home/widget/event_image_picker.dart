import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EventImagePicker extends StatefulWidget {
  final File? initialImage;
  final Function(File?) onImagePicked;

  const EventImagePicker({
    super.key,
    this.initialImage,
    required this.onImagePicked,
  });

  @override
  State<EventImagePicker> createState() => _EventImagePickerState();
}

class _EventImagePickerState extends State<EventImagePicker> {
  File? _pickedImage;
  final ImagePicker _imagePicker = ImagePicker();

  @override
  void initState() {
    _pickedImage = widget.initialImage;
    super.initState();
  }

  Future<void> _pickImage() async {
    final pickedFile =
    await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
      widget.onImagePicked(_pickedImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: _pickedImage != null
          ? Image.file(
        _pickedImage!,
        height: 200,
        width: double.infinity,
        fit: BoxFit.cover,
      )
          : Container(
        height: 200,
        width: double.infinity,
        color: Colors.grey[300],
        child: Icon(
          Icons.add_a_photo,
          size: 50,
          color: Colors.grey[700],
        ),
      ),
    );
  }
}
