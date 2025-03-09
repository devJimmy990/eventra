import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path_provider/path_provider.dart';
import 'package:eventra/features/user/profile/cubit/profile_cubit.dart';

class EditProfilePage extends StatefulWidget {
  final String currentName;
  final String currentAvatarPath;
  final String currentAboutMe;
  final String? currentPhone;
  final String? currentEmail;

  const EditProfilePage({
    Key? key,
    required this.currentName,
    required this.currentAvatarPath,
    required this.currentAboutMe,
    this.currentPhone,
    this.currentEmail,
  }) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _nameController;
  late TextEditingController _aboutMeController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  File? _selectedImage;

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.currentName);
    _aboutMeController = TextEditingController(text: widget.currentAboutMe);
    _phoneController = TextEditingController(text: widget.currentPhone ?? '');
    _emailController = TextEditingController(text: widget.currentEmail ?? '');
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      final savedImagePath =
          await _saveImageToLocalStorage(File(pickedFile.path));
      if (savedImagePath != null) {
        setState(() {
          _selectedImage = File(savedImagePath);
        });
      }
    }
  }

  Future<String?> _saveImageToLocalStorage(File imageFile) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final fileName =
          'profile_image_${DateTime.now().millisecondsSinceEpoch}.png';
      final imagePath = '${directory.path}/$fileName';

      await imageFile.copy(imagePath);

      return imagePath;
    } catch (e) {
      print('Error saving image to local storage: $e');
      return null;
    }
  }

  void _saveProfile(BuildContext context) async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    String? avatarPath = widget.currentAvatarPath;

    if (_selectedImage != null) {
      avatarPath = _selectedImage!.path;
    }

    final updatedData = {
      'name': _nameController.text,
      'bio': _aboutMeController.text,
      'phone': _phoneController.text.isNotEmpty ? _phoneController.text : null,
      'email': _emailController.text.isNotEmpty ? _emailController.text : null,
      'avatar': avatarPath,
    };

    context.read<ProfileCubit>().updateUserProfile(user.uid, updatedData);

    Navigator.pop(context, updatedData);
  }

  void _showImagePickerBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Choose an option',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    _pickImage(ImageSource.camera);
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.camera_alt),
                  label: Text('Camera'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    _pickImage(ImageSource.gallery);
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.photo_library),
                  label: Text('Gallery'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Edit Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => _saveProfile(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => _showImagePickerBottomSheet(context),
              child: CircleAvatar(
                radius: 70,
                backgroundImage: _selectedImage != null
                    ? FileImage(_selectedImage!)
                    : widget.currentAvatarPath.startsWith('assets/images')
                        ? AssetImage(widget.currentAvatarPath) as ImageProvider
                        : FileImage(File(widget.currentAvatarPath)),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              cursorColor: Colors.deepPurpleAccent,
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(color: Colors.deepPurpleAccent),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurpleAccent),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              cursorColor: Colors.deepPurpleAccent,
              controller: _phoneController,
              decoration: InputDecoration(
                hintText: 'Add Phone',
                labelText: 'Phone',
                labelStyle: TextStyle(color: Colors.deepPurpleAccent),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurpleAccent),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              cursorColor: Colors.deepPurpleAccent,
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Add Email',
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.deepPurpleAccent),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurpleAccent),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              cursorColor: Colors.deepPurpleAccent,
              controller: _aboutMeController,
              decoration: InputDecoration(
                labelText: 'About Me',
                labelStyle: TextStyle(color: Colors.deepPurpleAccent),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurpleAccent),
                ),
              ),
              maxLines: 4,
            ),
          ],
        ),
      ),
    );
  }
}
