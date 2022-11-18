import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:new_project/screens/EditAd_screen.dart';
import 'package:new_project/widgets/CustomButton_widget.dart';
import 'package:new_project/widgets/CustomTextField2_widget.dart';
import 'package:new_project/widgets/CustomTextField_widget.dart';
import '../widgets/NewPhoto_widget.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class CreateAdScreen extends StatefulWidget {
  const CreateAdScreen({super.key});

  @override
  State<CreateAdScreen> createState() => _CreateAdScreenState();
}

class _CreateAdScreenState extends State<CreateAdScreen> {
  List<String> currentImages = [];
  String _imagePath = '';
  String _imageServerPath = '';

  @override
  Widget build(BuildContext context) {
    TextEditingController _titleCtrl = TextEditingController();
    TextEditingController _priceCtrl = TextEditingController();
    TextEditingController _mobileCtrl = TextEditingController();
    TextEditingController _descriptionCtrl = TextEditingController();

    _upload(filePath) async {
      var url = Uri.parse("https://adlisting.herokuapp.com/upload/profile");
      var request = http.MultipartRequest('POST', url);
      http.MultipartFile image =
          await http.MultipartFile.fromPath('avatar', filePath);
      request.files.add(image);
      var response = await request.send();
      var resp = await response.stream.bytesToString();
      var respJson = jsonDecode(resp);
      setState(() {
        _imageServerPath = respJson['data']['path'];
        currentImages.add(_imageServerPath);
      });
      print('new list: $currentImages');
    }

    void captureImageFromGallery() async {
      var file = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (file != null) {
        setState(() {
          _imagePath = file.path;
        });
        _upload(file.path);
      }
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Align(
            alignment: Alignment.center,
            child: Text('Create Ad'),
          ),
        ),
        body: Column(
          children: [
            GestureDetector(
              onTap: () {
                captureImageFromGallery();
              },
              child: NewPhotoWidget(),
            ),
            ImagesList(images: currentImages),
            CustomTextFieldWidget(controller: _titleCtrl, hint: 'Title'),
            CustomTextFieldWidget(controller: _priceCtrl, hint: 'Price'),
            CustomTextFieldWidget(controller: _mobileCtrl, hint: 'Mobile'),
            CustomTextFieldWidget2(controller: _descriptionCtrl),
            CustomButton(
              str: 'Submit Ad',
              action: 'createAd',
              title: _titleCtrl,
              price: _priceCtrl,
              mobile: _mobileCtrl,
              images: currentImages,
              description: _descriptionCtrl,
            )
            /*SizedBox(
              height: 20,
            ),*/
            /*CustomButton(
              str: 'Submit Ad',
              route: '/MyAdsScreen',
            )*/
          ],
        ),
      ),
    );
  }
}
