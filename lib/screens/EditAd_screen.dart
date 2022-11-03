import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/widgets/CustomButton_widget.dart';
import 'package:new_project/widgets/CustomTextField2_widget.dart';
import 'package:new_project/widgets/NewPhoto_widget.dart';
import 'package:new_project/widgets/CustomTextField_widget.dart';

class EditAdScreen extends StatefulWidget {
  dynamic ads;

  EditAdScreen({super.key, required this.ads});

  @override
  State<EditAdScreen> createState() => _EditAdScreenState();
}

class _EditAdScreenState extends State<EditAdScreen> {
  @override
  Widget build(BuildContext context) {
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
            NewPhotoWidget(),
            ImagesList(widget: widget),
            CustomTextFieldWidget(str: widget.ads['title'], hint: ''),
            CustomTextFieldWidget(
                str: widget.ads['price'].toString(), hint: ''),
            CustomTextFieldWidget(str: widget.ads['mobile'], hint: ''),
            CustomTextFieldWidget2(str: widget.ads['description']),
            submitAdButton()
          ],
        ),
      ),
    );
  }
}

class submitAdButton extends StatelessWidget {
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
}

class ImagesList extends StatelessWidget {
  const ImagesList({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final EditAdScreen widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.ads['images'].length,
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
                    "${widget.ads['images'][index]}",
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
}
