import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_web/pages/HomePage.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:file/file.dart' as File;

class AddData extends StatefulWidget {
  AddData({Key? key}) : super(key: key);

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  List<String> types = ["Stray", "Breed"];
  final _storage = firebase_storage.FirebaseStorage.instance;
  final _uploadInput = InputElement(type: 'file');
  String? _dropDownValue;
  Uint8List? _selectedImage;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _speciesController = TextEditingController();

  final DatabaseReference ref = FirebaseDatabase.instance.ref('pet');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
            ),
            SizedBox(height: 1.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: TextFormField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Age'),
              ),
            ),
            SizedBox(height: 1.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: TextFormField(
                controller: _speciesController,
                decoration: InputDecoration(labelText: 'Species'),
              ),
            ),
            SizedBox(height: 1.h),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: DropdownButtonFormField(
                  elevation: 0,
                  hint: Text("Type"),
                  value: _dropDownValue,
                  items: const [
                    DropdownMenuItem(
                      child: Text("Stray"),
                      value: "Stray",
                    ),
                    DropdownMenuItem(
                      child: Text("Breed"),
                      value: "Breed",
                    )
                  ],
                  onChanged: (value) {
                    setState(() {
                      _dropDownValue = value!;
                    });
                  },
                )),
            SizedBox(height: 1.h),
            Container(
              height: 40.h,
              width: 40.w,
              child: _selectedImage != null
                  ? Image.memory(_selectedImage!)
                  : Image.asset('assets/no_image.jpg'),
            ),
            SizedBox(height: 1.h),
            ElevatedButton(
              onPressed: _getImage,
              child: Text('Select Photo'),
            ),
            SizedBox(height: 3.h),
            ElevatedButton(
              onPressed: _uploadFile,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  void _getImage() {
    _uploadInput.accept = 'image/*';
    _uploadInput.click();

    _uploadInput.onChange.listen((e) {
      final files = _uploadInput.files;
      if (files != null && files.isNotEmpty) {
        final file = files[0];
        final reader = FileReader();

        reader.onLoadEnd.listen((e) {
          setState(() {
            _selectedImage = reader.result as Uint8List?;
          });
        });

        reader.readAsArrayBuffer(file);
      }
    });
  }

  void _uploadFile() async {
    var newIndex = ref.push().key;
    final file = _uploadInput.files!.first as File.File;
    final fileName = DateTime.now().millisecondsSinceEpoch.toString();
    final storageRef = _storage.ref().child('photos/$fileName');

    try {
      await storageRef.putFile(file);
      final downloadURL = await storageRef.getDownloadURL();
      // final snapshot = await storageRef.putBlob(file);

      // final downloadUrl = await snapshot.ref.getDownloadURL();

      // setState(() {
      //   _imageUrl = downloadUrl;
      // });

      ref.child(newIndex!).set({
        "name": _nameController.text,
        "type": _dropDownValue,
        "age": _ageController.text,
        "species": _speciesController.text,
        "image": downloadURL
      });

      print('Upload Complete');
      Get.off(() => const HomePage());
      // Do something with the download URL or file metadata
    } catch (error) {
      print('Upload Error: $error');
      // Handle any errors that occur during the file upload
    }
  }

  @override
  void initState() {
    super.initState();
    _dropDownValue = "Stray";
    _uploadInput.onChange.listen((event) {
      final fileList = _uploadInput.files;
      if (fileList != null && fileList.isNotEmpty) {
        setState(() {
          _selectedImage = null;
        });
      }
    });
  }
}
