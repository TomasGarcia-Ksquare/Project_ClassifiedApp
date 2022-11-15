import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageViewerScreen extends StatefulWidget {
  dynamic images;

  ImageViewerScreen({
    super.key,
    required this.images,
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
            itemCount: widget.images['images'].length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    SizedBox(
              width: double.infinity,
              child: Image.network(
                "${widget.images['images'][itemIndex]}",
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
