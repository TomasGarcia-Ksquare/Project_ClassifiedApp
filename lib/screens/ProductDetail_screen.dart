import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:new_project/models/ads.dart';
import 'package:new_project/screens/MyAds_screen.dart';
import 'package:new_project/widgets/CustomButton_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  Map<String, dynamic> ads; //JSON

  ProductDetailScreen({super.key, required this.ads});
  //final List products

  @override
  Widget build(BuildContext context) {
    String adsDecoded = jsonEncode(ads);
    var data = jsonDecode(adsDecoded);
    //print(data['ads']['mobile']);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductTitle(title: data['ads']['title']),
            ProductPrice(price: data['ads']['price']),
            ProductImage(images: data['ads']['images']),
            ProductInfo(
                createdAt: data['ads']['createdAt'],
                createdBy: data['ads']['authorName']),
            ProductDescription(description: data['ads']['description']),
            /*CustomButton(
              str: 'Contact Seller',
              dialNumber: 'tel:+913698521470',
            )*/
            CustomButton(
              str: 'Contact Seller',
              action: 'dialNumber',
              dialNumber: data['ads']['mobile'],
            )
          ],
        ),
      ),
    );
  }
}

class ProductDescription extends StatelessWidget {
  final String description;
  const ProductDescription({
    Key? key,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
      child: SizedBox(
        child: Expanded(
          child: Text(description),
        ),
      ),
    );
  }
}

class ProductInfo extends StatelessWidget {
  final String createdBy;
  final String createdAt;
  const ProductInfo({
    Key? key,
    required this.createdBy,
    required this.createdAt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Icon(
            Icons.person_outline,
            size: 20,
          ),
          Text(createdBy),
          SizedBox(
            width: 12,
          ),
          Icon(
            Icons.timer_outlined,
            size: 20,
          ),
          Text(createdAt),
        ],
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  final List images;
  const ProductImage({
    Key? key,
    required this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/ImageViewerScreen',
          arguments: {'images': images},
        );
      },
      child: Container(
        color: Colors.purple,
        width: double.infinity,
        height: 250,
        child: Image.network(
          images[0],
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class ProductPrice extends StatelessWidget {
  final int price;
  const ProductPrice({
    Key? key,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
      child: Text(
        price.toString(),
        textAlign: TextAlign.start,
        style: TextStyle(color: Color(0xfff25723), fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ProductTitle extends StatelessWidget {
  final String title;
  const ProductTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: SizedBox(
        //color: Colors.red,
        //height: 80,
        child: Expanded(
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
