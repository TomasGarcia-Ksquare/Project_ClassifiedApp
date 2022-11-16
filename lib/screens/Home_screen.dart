import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/data/Ads_data.dart';
import 'package:new_project/models/ads.dart';
import 'package:new_project/services/ads.dart';
import 'package:new_project/services/profile.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Ads Listing"),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/SettingsScreen');
                },
                child: FutureBuilder(
                  future: ProfileService().fetchUser(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      Map user = snapshot.data!;
                      return CircleAvatar(
                        backgroundImage: NetworkImage(user['imgURL']),
                      );
                    }
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text('Error'),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        body: FutureBuilder(
          future: AdsService().getAllAds(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<AdsModel> ads = snapshot.data!;
              //print(ads[13].images![0]);
              //print(jsonEncode(ads));
              return Container(
                height: double.infinity,
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: ads.length,
                  itemBuilder: (context, index) {
                    //print(jsonEncode(ads[index]));
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/ProductDetailScreen',
                          arguments: {'ads': ads[index]},
                        );
                      },
                      child: Stack(
                        children: [
                          SizedBox(
                            height: double.infinity,
                            child: Image.network(
                              ads[index].images![0],
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset('./images/city.jpg');
                              },
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              color: Colors.black.withOpacity(0.5),
                              width: double.infinity,
                              //height: 70,
                              child: Padding(
                                padding: const EdgeInsets.all(7),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ProductInfo(
                                      title: ads[index].title!,
                                      /*ads: ads,
                                      index: index,
                                      str: 'title',*/
                                      txtColor: 0xffffffff,
                                    ),
                                    ProductInfo(
                                      title: ads[index].price!.toString(),
                                      /*ads: ads,
                                      index: index,
                                      str: 'price',*/
                                      txtColor: 0xfff25723,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text("Something wrong"),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ), //HomeGrid(ads: AdsData().ads),
        floatingActionButton:
            const CustomFloatingActionButton(icon: Icons.add_a_photo_outlined),
      ),
    );
  }
}

class CustomFloatingActionButton extends StatelessWidget {
  final IconData icon;

  const CustomFloatingActionButton({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, '/CreateAdScreen');
      },
      backgroundColor: const Color(0xfff25723),
      child: Icon(
        icon,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}

/*
class HomeGrid extends StatelessWidget {
  const HomeGrid({
    Key? key,
    required this.ads,
  }) : super(key: key);

  final List ads;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        itemCount: ads.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/ProductDetailScreen',
                arguments: {'ads': ads[index]},
              );
            },
            child: Stack(
              children: [
                SizedBox(
                  height: double.infinity,
                  child: Image.network(
                    ads[index]['images'][0],
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                    width: double.infinity,
                    //height: 70,
                    child: Padding(
                      padding: const EdgeInsets.all(7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ProductInfo(
                            ads: ads,
                            index: index,
                            str: 'title',
                            txtColor: 0xffffffff,
                          ),
                          ProductInfo(
                            ads: ads,
                            index: index,
                            str: 'price',
                            txtColor: 0xfff25723,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
*/
class ProductInfo extends StatelessWidget {
  /*final int index;
  final String str;*/
  final int txtColor;

  const ProductInfo(
      {Key? key,
      required this.title,
      /*required this.ads,
      required this.index,
      required this.str,*/
      required this.txtColor})
      : super(key: key);

  //final List ads;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      //ads[index][str].toString(),
      style: TextStyle(
        color: Color(txtColor),
      ),
    );
  }
}
