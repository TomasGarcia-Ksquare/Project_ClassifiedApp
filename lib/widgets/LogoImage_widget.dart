import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          color: Colors.black.withOpacity(.5),
          height: 300,
          child: Image.asset(
            './images/city.jpg',
            fit: BoxFit.fill,
          ),
        ),
        Container(
           height: 300,
          color: Colors.black.withOpacity(.5),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_city,
              size: 60,
              color: Colors.white,
            ),
            Column(
              children: [
                Text(
                  "CLASSIFIED APP",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text("SELL ANYTING INSTANTLY",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10)),
              ],
            )
          ],
        )
      ],
    );
  }
}
