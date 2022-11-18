import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_project/widgets/CustomButton_widget.dart';
import 'package:new_project/widgets/CustomTextField2_widget.dart';
import 'package:new_project/widgets/NewPhoto_widget.dart';
import 'package:new_project/widgets/CustomTextField_widget.dart';
import 'package:http/http.dart' as http;

class EditAdScreen extends StatefulWidget {
  dynamic ads;

  EditAdScreen({super.key, required this.ads});

  @override
  State<EditAdScreen> createState() => _EditAdScreenState();
}

class _EditAdScreenState extends State<EditAdScreen> {
  TextEditingController _titleCtrl = TextEditingController();
  TextEditingController _priceCtrl = TextEditingController();
  TextEditingController _mobileCtrl = TextEditingController();
  TextEditingController _descriptionCtrl = TextEditingController();

  String _imagePath = '';
  String _imageServerPath = '';

  /*void captureImageFromCamera() async {
    var file = await ImagePicker().pickImage(source: ImageSource.camera);
    if (file != null) {
      print(file.path);
      setState(() {
        _imagePath = file.path;
      });
    }
  }*/

  @override
  Widget build(BuildContext context) {
    String adsEncoded = jsonEncode(widget.ads);
    var data = jsonDecode(adsEncoded);

    List<String>? currentImages = widget.ads['ads'].images!;
    //print('local images: $currentImages');

    _titleCtrl.text = widget.ads['ads'].title!;
    _priceCtrl.text = widget.ads['ads'].price!.toString();
    _mobileCtrl.text = widget.ads['ads'].mobile!;
    _descriptionCtrl.text = widget.ads['ads'].description!;

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
        currentImages!.add(_imageServerPath);
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
    //print(data['ads']['_id']);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Align(
            alignment: Alignment.center,
            child: (Text('Edit Ad')),
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
            ImagesList(images: currentImages!),
            CustomTextFieldWidget(controller: _titleCtrl, hint: ''),
            CustomTextFieldWidget(controller: _priceCtrl, hint: ''),
            CustomTextFieldWidget(controller: _mobileCtrl, hint: ''),
            CustomTextFieldWidget2(controller: _descriptionCtrl),
            //submitAdButton()
            CustomButton(
              str: 'Submit Ad',
              action: 'editAd',
              id: widget.ads['ads'].sId!,
              title: _titleCtrl,
              price: _priceCtrl,
              mobile: _mobileCtrl,
              images: currentImages,
              description: _descriptionCtrl,
            )
          ],
        ),
      ),
    );
  }
}

/*class submitAdButton extends StatelessWidget {
  const submitAdButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: SizedBox(
        width: double.infinity,
        height: 45,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Submit Ad'),
        ),
      ),
    );
  }
}*/

class ImagesList extends StatelessWidget {
  final List images;

  const ImagesList({
    Key? key,
    required this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (images.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Image.network(
                      images[index],
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
    }
    return Container();
  }
}
