import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageViewerScreen extends StatefulWidget {
  //final List<Widget> products;
  dynamic data;

  ImageViewerScreen({
    super.key,
    //required this.products,
    required this.data,
  });

  @override
  State<ImageViewerScreen> createState() => _ImageViewerScreenState();
}

class _ImageViewerScreenState extends State<ImageViewerScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: CarouselSlider.builder(
            options: CarouselOptions(),
            itemCount: widget.data['images'].length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    SizedBox(
              width: double.infinity,
              child: Image.network(
                "${widget.data['images'][itemIndex]}",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.black,
          child: Icon(
            Icons.cancel,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
