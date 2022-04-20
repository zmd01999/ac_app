import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maple/src/screens/devices_screen/device_total/components/mytheme.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:maple/utils/shared_preferences_util.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({Key? key}) : super(key: key);

  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  // Future getImageFromCamera() async {
  //   var image = await _picker.pickImage(source: ImageSource.camera);
  //   setState(() {
  //     imagePath = image as File?;
  //   });
  // }
  void _startUpload() async{
    //Create a unique random name for the file to upload
    String name = await SharedPreferencesUtil.getUserDetail().then((value) => value!.username);
    //Instantiate a path for the files to be uploaded.
    final ref = FirebaseStorage.instance.ref().child('images/$name.png');

    //We will store the uploaded file's url in this variable to access later
    var url;

    //As the name says "putfile" is used to put your file (upload) in the firebase
    await ref.putFile(_image!).then((value) async{
      print("Inside then");
      url = await ref.getDownloadURL();
      SmartDialog.showToast("头像上传成功！");
      SharedPreferencesUtil.setCache(SharedPreferencesUtil.HEAD_PIC, url);
      print(url);
    });
  }

  Future getImageFromGallery() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image!.path);
    });
    _startUpload();

  }

  // @override
  // void initState() {
  //   super.initState();
  //   Firebase.initializeApp().whenComplete(() {
  //     print("completed");
  //     setState(() {});
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white70,
          boxShadow: [
            BoxShadow(spreadRadius: 6, color: Colors.white70),
          ]),
      child: _image == null ? IconButton(
        icon: const Icon(
          Icons.upload_rounded,
          color: MyTheme.indigo,
          size: 30,
        ),
        onPressed: () {
          getImageFromGallery();
          // Save Image to some storage
        },
      ) : InkWell(
        onTap: () {
          getImageFromGallery();

        },
        child: ClipRRect(
            child: Image.file(
              _image!,
              fit: BoxFit.cover,
            ),
          borderRadius: BorderRadius.circular(35),
        ),
      ),
    );
  }
}
