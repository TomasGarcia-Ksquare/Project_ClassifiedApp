import 'package:flutter/material.dart';
import 'package:new_project/widgets/CustomButton_widget.dart';

class ProductDetailScreen extends StatefulWidget {
  dynamic ads;
  ProductDetailScreen({super.key, required this.ads});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  //final List products

  @override
  Widget build(BuildContext context) {
    //final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductTitle(widget: widget),
            ProductPrice(widget: widget),
            ProductImage(widget: widget),
            ProductInfo(widget: widget),
            ProductDescription(widget: widget),
            CustomButton(
              str: 'Contact Seller',
              dialNumber: 'tel:+913698521470',
            )
          ],
        ),
      ),
    );
  }
}

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final ProductDetailScreen widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
      child: SizedBox(
        child: Expanded(
          child: Text("${widget.ads['ads']['description']}"),
        ),
      ),
    );
  }
}

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final ProductDetailScreen widget;

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
          Text("${widget.ads['ads']['createdBy']}"),
          SizedBox(
            width: 12,
          ),
          Icon(
            Icons.timer_outlined,
            size: 20,
          ),
          Text("${widget.ads['ads']['createdAt']}"),
        ],
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final ProductDetailScreen widget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/ImageViewerScreen',
          arguments: {'images': widget.ads['ads']['images']},
        );
      },
      child: Container(
        color: Colors.purple,
        width: double.infinity,
        height: 250,
        child: Image.network(
          "${widget.ads['ads']['images'][0]}",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class ProductPrice extends StatelessWidget {
  const ProductPrice({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final ProductDetailScreen widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
      child: Text(
        "${widget.ads['ads']['price']}",
        textAlign: TextAlign.start,
        style: TextStyle(color: Color(0xfff25723), fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ProductTitle extends StatelessWidget {
  const ProductTitle({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final ProductDetailScreen widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: SizedBox(
        //color: Colors.red,
        //height: 80,
        child: Expanded(
          child: Text(
            "${widget.ads['ads']['title']}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
